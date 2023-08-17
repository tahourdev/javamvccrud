<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Table</title>
                <script src="https://cdn.tailwindcss.com"></script>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
                <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

                <script>
                    tailwind.config = {
                        theme: {
                            screens: {
                                sm: "640px",
                                // => @media (min-width: 640px) { ... }

                                md: "768px",
                                // => @media (min-width: 768px) { ... }

                                lg: "1024px",
                                // => @media (min-width: 1024px) { ... }

                                xl: "1280px",
                                // => @media (min-width: 1280px) { ... }

                                "2xl": "1536px",
                                // => @media (min-width: 1536px) { ... }
                            },
                            extend: {},
                        },
                    };
                </script>
            </head>

            <body>
                <div class="w-full h-screen">
                    <div class="max-w-[1280px] w-full mx-auto px-8 my-8">
                        <div
                            class="rounded-lg overflow-hidden w-full py-10 shadow-md py-8 shadow-gray/10 ring-[1px] ring-gray-600/10">
                            <div class="mx-2">
                                <div class="px-4">
                                    <div class="space-y-4 flex items-center flex-wrap">
                                        <div class="mr-auto">
                                            <h1 class="font-medium">Users</h1>
                                            <p class="font-light text-sm text-gray-600 mt-2">
                                                A list of all the users in your account including their name, title,
                                                email and role.
                                            </p>
                                        </div>
                                        <button type="button">
                                            <a class="text-white hover:no-underline cursor-pointer hover:bg-indigo-600/80 px-3 py-2 text-sm bg-indigo-600 rounded-md"
                                                href="/addMember">
                                                Add User
                                            </a>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-10 w-full overflow-x-auto">
                                <div class="px-6 w-full">
                                    <form:form>
                                        <table class="w-full table-auto">
                                            <thead>
                                                <tr class="border-b-[1px] border-b-gray-500/30">
                                                    <th class="text-left pr-14 py-4 text-sm font-medium">Id</th>
                                                    <th class="text-left pr-24 py-4 text-sm font-medium">Name</th>
                                                    <th class="text-left pr-40 py-4 text-sm font-medium">Title</th>
                                                    <th class="text-left pr-40 py-4 text-sm font-medium">Email</th>
                                                    <th class="text-left py-4 text-sm font-medium">Role</th>
                                                    <td class="px-6 py-4 text-right text-sm font-medium">
                                                        <span class="">Action</span>
                                                    </td>
                                                </tr>
                                            </thead>

                                            <c:forEach var="member" items="${memberList}">
                                                <tbody class="w-full divide-y">
                                                    <tr>
                                                        <th class="text-left py-6 text-sm font-normal">
                                                            ${member.id}
                                                        </th>
                                                        <th class="text-left py-6 text-sm font-normal">
                                                            ${member.userName}
                                                        </th>
                                                        <td class="text-left py-6 text-sm text-gray-500 font-light">
                                                            ${member.jobTitle}</td>
                                                        <td class="text-left py-6 text-sm text-gray-500 font-light">
                                                            ${member.email}</td>
                                                        <td class="text-left py-6 text-sm text-gray-500">${member.role}
                                                        </td>
                                                        <td class="px-6 py-4 text-right text-sm">
                                                            <span class="pr-2">
                                                                <a href="/editMember/${member.id}"
                                                                    class="font-medium text-blue-600 dark:text-blue-500 hover:underline">
                                                                    <i class="ri-edit-line"></i>
                                                                </a>
                                                            </span>
                                                            <span>

                                                                <a href="/deleteMember/${member.id}"
                                                                    class="font-medium text-blue-600 dark:text-blue-500 hover:underline">
                                                                    <i class="ri-delete-bin-6-line"></i>
                                                                </a>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </c:forEach>
                                        </table>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            <script th:inline="javascript">
                window.onload = function () {
                    var msg = "${message}";
                    console.log(msg);
                    if (msg == "Save Success") {
                        Command: toastr["success"]("Member Added successfully!!")
                    } else if (msg == "Delete Success") {
                        Command: toastr["success"]("Member deleted successfully!!")
                    } else if (msg == "Delete Failure") {
                        Command: toastr["error"]("Some error occurred, couldn't delete member")
                    } else if (msg == "Edit Success") {
                        Command: toastr["success"]("Member updated successfully!!")
                    }
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": true,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": false,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                }
            </script>

            </html>