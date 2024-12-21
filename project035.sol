// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LearningPlatform {
    address public admin;
    
    struct Course {
        uint256 id;
        string title;
        string description;
        uint256 price;
        bool isActive;
    }

    struct Student {
        uint256 id;
        address studentAddress;
        uint256[] enrolledCourses;
        mapping(uint256 => bool) completedCourses;
    }

    mapping(uint256 => Course) public courses;
    mapping(address => Student) public students;
    uint256 public courseCount;
    uint256 public studentCount;

    event CourseCreated(uint256 courseId, string title, uint256 price);
    event CourseEnrolled(address student, uint256 courseId);
    event CourseCompleted(address student, uint256 courseId);
    event CertificationIssued(address student, uint256 courseId);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action.");
        _;
    }

    modifier courseExists(uint256 courseId) {
        require(courses[courseId].id != 0, "Course does not exist.");
        _;
    }

    modifier studentExists(address student) {
        require(students[student].studentAddress != address(0), "Student does not exist.");
        _;
    }

    constructor() {
        admin = msg.sender;
        courseCount = 0;
        studentCount = 0;
    }

    // Create a new course
    function createCourse(string memory _title, string memory _description, uint256 _price) public onlyAdmin {
        courseCount++;
        courses[courseCount] = Course(courseCount, _title, _description, _price, true);
        emit CourseCreated(courseCount, _title, _price);
    }

    // Enroll a student in a course
    function enrollInCourse(uint256 courseId) public payable courseExists(courseId) {
        Course storage course = courses[courseId];
        require(course.isActive, "Course is not active.");
        require(msg.value == course.price, "Incorrect price for enrollment.");
        
        if (students[msg.sender].studentAddress == address(0)) {
            studentCount++;
            students[msg.sender].studentAddress = msg.sender;
        }
        
        students[msg.sender].enrolledCourses.push(courseId);
        emit CourseEnrolled(msg.sender, courseId);
    }

    // Mark a course as completed by the student
    function completeCourse(uint256 courseId) public studentExists(msg.sender) courseExists(courseId) {
        require(isEnrolledInCourse(msg.sender, courseId), "Student is not enrolled in this course.");
        students[msg.sender].completedCourses[courseId] = true;
        emit CourseCompleted(msg.sender, courseId);
    }

    // Check if a student is enrolled in a course
    function isEnrolledInCourse(address student, uint256 courseId) public view returns (bool) {
        for (uint256 i = 0; i < students[student].enrolledCourses.length; i++) {
            if (students[student].enrolledCourses[i] == courseId) {
                return true;
            }
        }
        return false;
    }

    // Issue certification to a student for completing a course
    function issueCertification(uint256 courseId) public studentExists(msg.sender) courseExists(courseId) {
        require(students[msg.sender].completedCourses[courseId], "Course not completed.");
        emit CertificationIssued(msg.sender, courseId);
    }

    // Deactivate a course (only admin can deactivate)
    function deactivateCourse(uint256 courseId) public onlyAdmin courseExists(courseId) {
        courses[courseId].isActive = false;
    }

    // Withdraw funds (admin can withdraw collected fees)
    function withdraw() public onlyAdmin {
        payable(admin).transfer(address(this).balance);
    }

    // Get student details
    function getStudentDetails(address studentAddress) public view returns (uint256[] memory enrolledCourses, uint256[] memory completedCourses) {
        Student storage student = students[studentAddress];
        uint256 enrolledCount = student.enrolledCourses.length;
        uint256[] memory completedCoursesList = new uint256[](enrolledCount);
        
        for (uint256 i = 0; i < enrolledCount; i++) {
            completedCoursesList[i] = student.completedCourses[student.enrolledCourses[i]] ? 1 : 0;
        }

        return (student.enrolledCourses, completedCoursesList);
    }
}