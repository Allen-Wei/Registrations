(function () {
    angular.module('registration.services', [])
        .factory('TipSvc', function ($timeout) {
            var service = {
                show: false,
                text: '',
                duration: function (txt, time) {
                    this.show = true;
                    this.text = txt || 'Eorror parameters.';
                    $timeout(function () {
                        service.show = false;
                    }, time || 2000);
                }
            };
            return service;
        }).constant('AppConstant', {
            ngDateFormat: 'yyyy-MM-dd',
            ngDateFormatDetail: 'yyyy-MM-dd h:mm:ss a',
            uiDateFormat: 'yy-mm-dd',
            perPageLittle: 10,
            perPage: 10,
            perPageLarge: 50,
        });
})();
