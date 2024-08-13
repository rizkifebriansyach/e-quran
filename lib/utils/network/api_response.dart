class ApiResponse<T> {
  final int code;
  final String? message;
  final String? error;
  final T? data;

  ApiResponse({
    required this.code,
    required this.message,
    this.error,
    this.data,
  });

  factory ApiResponse.fromJson(Map<dynamic, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      message: (json['message'] != null) ? json['message'] : null,
      error: (json['error'] != null) ? json['error'] : null,
      data: (json['data'] != null) ? json['data'] : null,
    );
  }
}
