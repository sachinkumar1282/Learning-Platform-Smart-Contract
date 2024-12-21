# Learning Platform Smart Contract

## Project Title

Learning Platform

## Project Description

The Learning Platform is a decentralized education system powered by blockchain technology, designed to facilitate online courses and certification processes. This platform allows admins to create courses, and students to enroll in and complete courses. Upon successful completion, students can receive certifications. The platform operates on the Ethereum blockchain, ensuring transparency, security, and automation of enrollment, course completion tracking, and certification issuance.

##Contract Address
0xF86F281D22f32111eC896410cb1d4Fee77C38F50
file:///Users/admin/Desktop/Screenshot%202024-12-21%20at%202.28.35%20PM.png

## Project Vision

The vision of the Learning Platform is to provide a transparent and trustless education environment, where students can enroll in courses, complete them at their own pace, and receive verifiable certifications without relying on centralized authorities. Through the use of blockchain technology, the platform ensures that course data, student progress, and certifications are tamper-proof and easily accessible.

## Key Features

- **Course Creation**: Admins can create new courses by specifying a title, description, and price.
  
- **Course Enrollment**: Students can enroll in courses by paying the exact price in Ether. Once enrolled, students can track their progress.

- **Course Completion Tracking**: Students can mark courses as completed once they have finished all required lessons. The platform tracks their progress.

- **Certification Issuance**: After completing a course, students can receive a verifiable certificate issued through the platform.

- **Student Enrollment Management**: The platform tracks the enrolled courses and completion status of each student. Students can view their enrolled and completed courses.

- **Deactivation of Courses**: Admins can deactivate courses, making them unavailable for new enrollments.

- **Admin Withdrawal**: Admins can withdraw the accumulated funds (course fees) from the platform.

- **Security**: All functions are secured by role-based access control. Only admins can create courses, deactivate courses, and withdraw funds.

## Smart Contract Functions

1. **createCourse**: Allows the admin to create a new course with title, description, and price.

2. **enrollInCourse**: Allows a student to enroll in a course by paying the required price in Ether.

3. **completeCourse**: Allows a student to mark a course as completed once they finish it.

4. **issueCertification**: Allows a student to receive a certification for completing a course.

5. **deactivateCourse**: Allows the admin to deactivate a course, preventing new students from enrolling.

6. **withdraw**: Allows the admin to withdraw the collected funds from course enrollments.

7. **getStudentDetails**: Provides the details of a student’s enrolled courses and their completion status.

## How to Use

1. **Deploy the Contract**: Deploy the contract to an Ethereum-compatible blockchain (e.g., Ethereum mainnet, Rinkeby testnet, etc.).

2. **Admin Access**: The admin (the address that deploys the contract) can create courses and deactivate them as needed.

3. **Student Interaction**: Students can interact with the platform to enroll in courses, complete them, and receive certificates.

4. **Fund Withdrawal**: Admin can withdraw funds earned from student enrollments.

