<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/28/24
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
    let center_websocket = {
        stompClient:null,
        init:function(){
            let socket = new SockJS('${serverUrl}/wss');
            <%--console.log('${serverUrl}');--%>
            this.stompClient = Stomp.over(socket);
            this.stompClient.connect({}, function(frame) {
                // console.log(frame);
                this.subscribe('/send2', function(msg) {
                    console.log(msg);
                    console.log(JSON.parse(msg.body).content1);
                    $('#msg1').text(JSON.parse(msg.body).content1);
                    $('#msg2').text(JSON.parse(msg.body).content2);
                    $('#msg3').text(JSON.parse(msg.body).content3);
                    $('#msg4').text(JSON.parse(msg.body).content4);
                    $('#progress1').css('width', JSON.parse(msg.body).content1/100*100+'%');
                    $('#progress1').attr('aria-valuenow', JSON.parse(msg.body).content1/100*100);
                    $('#progress2').css('width', JSON.parse(msg.body).content2/1000*100+'%');
                    $('#progress2').attr('aria-valuenow', JSON.parse(msg.body).content2/1000*100);
                    $('#progress3').css('width', JSON.parse(msg.body).content3/500*100+'%');
                    $('#progress3').attr('aria-valuenow', JSON.parse(msg.body).content3/500*100);
                    $('#progress4').css('width', JSON.parse(msg.body).content4/10*100+'%');
                    $('#progress4').attr('aria-valuenow', JSON.parse(msg.body).content4/10*100);
                });
            });
        }
    };
    let center = {
        init: function(){
            const defaultData = '${chartUrl}/logs/custinfo.log';
            const urlInput = document.getElementById('fetchURL');
            const pollingCheckbox = document.getElementById('enablePolling');
            const pollingInput = document.getElementById('pollingTime');

            function createChart() {
                Highcharts.chart('live_chart', {
                    chart: {
                        type: 'areaspline'
                    },
                    title: {
                        text: 'Live Data'
                    },
                    accessibility: {
                        announceNewData: {
                            enabled: true,
                            minAnnounceInterval: 15000,
                            announcementFormatter: function (
                                allSeries,
                                newSeries,
                                newPoint) {
                                if (newPoint) {
                                    return 'New point added. Value: ' + newPoint.y;
                                }
                                return false;
                            }
                        }
                    },
                    plotOptions: {
                        areaspline: {
                            color: '#32CD32',
                            fillColor: {
                                linearGradient: { x1: 0, x2: 0, y1: 0, y2: 1 },
                                stops: [
                                    [0, '#32CD32'],
                                    [1, '#32CD3200']
                                ]
                            },
                            threshold: null,
                            marker: {
                                lineWidth: 1,
                                lineColor: null,
                                fillColor: 'white'
                            }
                        }
                    },
                    data: {
                        csvURL: '${chartUrl}/logs/custinfo.log',
                        enablePolling: true,
                        dataRefreshRate: 1
                    }
                });

                // pollingInput.value=1;

                // if (pollingInput.value < 1 || !pollingInput.value) {
                //     pollingInput.value = 1;
                // }
            }

            // urlInput.value = defaultData;

            // We recreate instead of using chart update to make sure the loaded CSV
            // and such is completely gone.
            // pollingCheckbox.onchange = urlInput.onchange =
            //     pollingInput.onchange = createChart;

            // Create the chart
            createChart();
        }
    };

    $(function() {
        center.init();
        center_websocket.init();
    });
</script>
<body>
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
<%--        <div class="col-xl-3 col-md-6 mb-4">--%>
<%--            <div class="card border-left-primary shadow h-100 py-2">--%>
<%--                <div class="card-body">--%>
<%--                    <div class="row no-gutters align-items-center">--%>
<%--                        <div class="col mr-2">--%>
<%--                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">--%>
<%--                                Earnings (Monthly)</div>--%>
<%--                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>--%>
<%--                        </div>--%>
<%--                        <div class="col-auto">--%>
<%--                            <i class="fas fa-calendar fa-2x text-gray-300"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <!-- Earnings (Monthly) Card Example -->
<%--        <div class="col-xl-3 col-md-6 mb-4">--%>
<%--            <div class="card border-left-success shadow h-100 py-2">--%>
<%--                <div class="card-body">--%>
<%--                    <div class="row no-gutters align-items-center">--%>
<%--                        <div class="col mr-2">--%>
<%--                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">--%>
<%--                                Earnings (Annual)</div>--%>
<%--                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>--%>
<%--                        </div>--%>
<%--                        <div class="col-auto">--%>
<%--                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks 100</div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg1" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress1" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks 1000
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg2" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress2" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks 500
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg3" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress3" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks 10
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg4" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress4" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pending Requests Card Example -->
<%--        <div class="col-xl-3 col-md-6 mb-4">--%>
<%--            <div class="card border-left-warning shadow h-100 py-2">--%>
<%--                <div class="card-body">--%>
<%--                    <div class="row no-gutters align-items-center">--%>
<%--                        <div class="col mr-2">--%>
<%--                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">--%>
<%--                                Pending Requests</div>--%>
<%--                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>--%>
<%--                        </div>--%>
<%--                        <div class="col-auto">--%>
<%--                            <i class="fas fa-comments fa-2x text-gray-300"></i>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-8 col-lg-7">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
<%--                    <div class="dropdown no-arrow">--%>
<%--                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"--%>
<%--                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
<%--                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>--%>
<%--                        </a>--%>
<%--                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"--%>
<%--                             aria-labelledby="dropdownMenuLink">--%>
<%--                            <div class="dropdown-header">Dropdown Header:</div>--%>
<%--                            <a class="dropdown-item" href="#">Action</a>--%>
<%--                            <a class="dropdown-item" href="#">Another action</a>--%>
<%--                            <div class="dropdown-divider"></div>--%>
<%--                            <a class="dropdown-item" href="#">Something else here</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div id="live_chart">

                    </div>
<%--                    <div class="chart-area">--%>
<%--                        <canvas id="myAreaChart"></canvas>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                    <div class="dropdown no-arrow">
                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                             aria-labelledby="dropdownMenuLink">
                            <div class="dropdown-header">Dropdown Header:</div>
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-pie pt-4 pb-2">
                        <canvas id="myPieChart"></canvas>
                    </div>
                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Direct
                                        </span>
                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Social
                                        </span>
                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Referral
                                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Content Column -->
        <div class="col-lg-6 mb-4">

            <!-- Project Card Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                </div>
                <div class="card-body">
                    <h4 class="small font-weight-bold">Server Migration <span
                            class="float-right">20%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">Sales Tracking <span
                            class="float-right">40%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                             aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">Customer Database <span
                            class="float-right">60%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar" role="progressbar" style="width: 60%"
                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">Payout Details <span
                            class="float-right">80%</span></h4>
                    <div class="progress mb-4">
                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                             aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <h4 class="small font-weight-bold">Account Setup <span
                            class="float-right">Complete!</span></h4>
                    <div class="progress">
                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                             aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>

            <!-- Color System -->
            <div class="row">
                <div class="col-lg-6 mb-4">
                    <div class="card bg-primary text-white shadow">
                        <div class="card-body">
                            Primary
                            <div class="text-white-50 small">#4e73df</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-success text-white shadow">
                        <div class="card-body">
                            Success
                            <div class="text-white-50 small">#1cc88a</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-info text-white shadow">
                        <div class="card-body">
                            Info
                            <div class="text-white-50 small">#36b9cc</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-warning text-white shadow">
                        <div class="card-body">
                            Warning
                            <div class="text-white-50 small">#f6c23e</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-danger text-white shadow">
                        <div class="card-body">
                            Danger
                            <div class="text-white-50 small">#e74a3b</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-secondary text-white shadow">
                        <div class="card-body">
                            Secondary
                            <div class="text-white-50 small">#858796</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-light text-black shadow">
                        <div class="card-body">
                            Light
                            <div class="text-black-50 small">#f8f9fc</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="card bg-dark text-white shadow">
                        <div class="card-body">
                            Dark
                            <div class="text-white-50 small">#5a5c69</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-lg-6 mb-4">

            <!-- Illustrations -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                </div>
                <div class="card-body">
                    <div class="text-center">
                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                             src="img/undraw_posting_photo.svg" alt="...">
                    </div>
                    <p>Add some quality, svg illustrations to your project courtesy of <a
                            target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
                        constantly updated collection of beautiful svg images that you can use
                        completely free and without attribution!</p>
                    <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on
                        unDraw &rarr;</a>
                </div>
            </div>

            <!-- Approach -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                </div>
                <div class="card-body">
                    <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                        CSS bloat and poor page performance. Custom CSS classes are used to create
                        custom components and custom utility classes.</p>
                    <p class="mb-0">Before working with this theme, you should become familiar with the
                        Bootstrap framework, especially the utility classes.</p>
                </div>
            </div>

        </div>
    </div>

</div>
</body>
</html>
