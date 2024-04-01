<%--
  Created by IntelliJ IDEA.
  User: tkdalsss
  Date: 3/27/24
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .chart_layout {
        width: 300px;
        height: 400px;
        border: 2px solid red;
    }
</style>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script>
    let chart3 = {
        init: function() {
            this.getc1data();
            this.getc2data();
            this.getc3data();
        },
        getc1data: function(){
            $.ajax({
                url:'<c:url value="/chart/getChart3data1"/>',
                success: (data) => {
                    this.c1(data);
                }
            })
        },
        getc2data: function(){
            $.ajax({
                url:'<c:url value="/chart2"/>',
                success: (data) => {
                    this.c2(data);
                }
            })
        },
        getc3data: function(){
            this.c3();
        },
        c1: function(data) {
            // console.log(data);
            Highcharts.chart('c1', {

                title: {
                    text: 'U.S Solar Employment Growth',
                    align: 'left'
                },

                subtitle: {
                    text: 'By Job Category. Source: <a href="https://irecusa.org/programs/solar-jobs-census/" target="_blank">IREC</a>.',
                    align: 'left'
                },

                yAxis: {
                    title: {
                        text: 'Number of Employees'
                    }
                },

                xAxis: {
                    accessibility: {
                        rangeDescription: 'Range: 2010 to 2020'
                    }
                },

                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle'
                },

                plotOptions: {
                    series: {
                        label: {
                            connectorAllowed: false
                        },
                        pointStart: 2010
                    }
                },

                series: data,

                responsive: {
                    rules: [{
                        condition: {
                            maxWidth: 500
                        },
                        chartOptions: {
                            legend: {
                                layout: 'horizontal',
                                align: 'center',
                                verticalAlign: 'bottom'
                            }
                        }
                    }]
                }

            });

        },
        c2: function(data) {
            Highcharts.chart('c2', {
                chart: {
                    type: 'spline'
                },
                title: {
                    text: 'Monthly Average Temperature'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                        'target="_blank">Wikipedia.com</a>'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    accessibility: {
                        description: 'Months of the year'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Temperature'
                    },
                    labels: {
                        format: '{value}°'
                    }
                },
                tooltip: {
                    crosshairs: true,
                    shared: true
                },
                plotOptions: {
                    spline: {
                        marker: {
                            radius: 4,
                            lineColor: '#666666',
                            lineWidth: 1
                        }
                    }
                },
                series: data
            });
        },
        c3: function() {
            Highcharts.chart('c3', {
                chart: {
                    type: 'spline'
                },
                title: {
                    text: 'Monthly Average Temperature'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                        'target="_blank">Wikipedia.com</a>'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    accessibility: {
                        description: 'Months of the year'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Temperature'
                    },
                    labels: {
                        format: '{value}°'
                    }
                },
                tooltip: {
                    crosshairs: true,
                    shared: true
                },
                plotOptions: {
                    spline: {
                        marker: {
                            radius: 4,
                            lineColor: '#666666',
                            lineWidth: 1
                        }
                    }
                },
                series: [{
                    name: 'Tokyo',
                    marker: {
                        symbol: 'square'
                    },
                    data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, {
                        y: 26.4,
                        marker: {
                            symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
                        },
                        accessibility: {
                            description: 'Sunny symbol, this is the warmest point in the chart.'
                        }
                    }, 22.8, 17.5, 12.1, 7.6]

                }, {
                    name: 'Bergen',
                    marker: {
                        symbol: 'diamond'
                    },
                    data: [{
                        y: 1.5,
                        marker: {
                            symbol: 'url(https://www.highcharts.com/samples/graphics/snow.png)'
                        },
                        accessibility: {
                            description: 'Snowy symbol, this is the coldest point in the chart.'
                        }
                    }, 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
                }, {
                    name: 'Korea',
                    marker: {
                        symbol: 'diamond'
                    },
                    data: [{
                        y: -1.6,
                        marker: {
                            symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
                        },
                        accessibility: {
                            description: 'Sunny symbol, this is the warmest point in the chart.'
                        }
                    }, 2.3, 10.9, 13.5, 18.5, 30.5, 35.4, 16.5, 10.0, 9.2, -1.0, -13.2]

                }]
            });
        }
    };
    $(function() {
        chart3.init();
    })
</script>
<div class="container">
    <h2>Chart3 Page</h2>
    <div class="row well" id="result">
        <div id="c1" class="col-sm4 well chart_layout"></div>
        <div id="c2" class="col-sm4 well chart_layout"></div>
        <div id="c3" class="col-sm4 well chart_layout"></div>
    </div>
</div>
