<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
                <title>Create</title>
                <script src="https://cdn.tailwindcss.com"></script>
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
                <div class="w-full h-screen flex items-center">
                    <form:form action="/saveMember" method="post" modelAttribute="member" class="w-full">
                        <div class="max-w-[500px] w-full mx-auto px-4">
                            <div class="w-full rounded-lg shadow-md py-8 shadow-gray/10 ring-[1px] ring-gray-600/10">
                                <div class="space-y-8">
                                    <div class="space-y-3 px-4">
                                        <div class="space-y-2">
                                            <label class="text-sm text-slate-600 font-normal">User Name</label>
                                            <form:input type="text" path="userName" id="userName" name="userName"
                                                placeholder="Username" required="required"
                                                class="w-full text-sm p-2 rounded-md ring-[1px] ring-gray-600/10" />
                                        </div>
                                        <div class="space-y-2">
                                            <label class="text-sm text-slate-600 font-normal">Email</label>
                                            <form:input type="text" id="email" path="email" name="email"
                                                placeholder="Email" required="required" class="w-full text-sm p-2 rounded-md ring-[1px] ring-gray-600/10
                                                {{error ? 'text-red-500 border-red-500' : '' }}" />
                                        </div>
                                        <div class="space-y-2">
                                            <label class="text-sm text-slate-600 font-normal">Job Title</label>
                                            <form:input type="text" path="jobTitle" id="jobTitle" name="jobTitle"
                                                placeholder="Job Title" required="required"
                                                class="w-full text-sm p-2 rounded-md ring-[1px] ring-gray-600/10" />
                                        </div>
                                        <div class="space-y-2">
                                            <label class="text-sm text-slate-600 font-normal">Role</label>
                                            <form:select id="rol" path="role" name="role"
                                                class="w-full p-2 bg-white rounded-md ring-[1px] ring-gray-600/10 text-sm">
                                                <option value="admin">Admin</option>
                                                <option value="member">Member</option>
                                                <option value="owner">Owner</option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="text-right px-4 text-sm space-x-8">
                                        <a href="/" class="cursor-pointer">Cancel</a>
                                        <button type="submit" value="Register"
                                            class="bg-indigo-600 px-8 py-2 text-white rounded-md hover:bg-indigo-600/80">
                                            Create
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </body>

            <script th:inline="javascript">
                window.onload = function () {

                    var msg = "${message}";
                    console.log(msg);
                    if (msg == "Save Failure") {
                        Command: toastr["error"]("Something went wrong with the save.")
                    }
                    if (msg == "Email already exists") {
                        Command: toastr["error"]("Email Already Exists")
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