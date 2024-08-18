
// Cấu hình giá cho các nền tảng xã hội và nội dung
import 'package:flutter_components_sdk/core/constants/enum.dart';

final PRICING_OPTS = {
  ESocialType.TIKTOK: {
    ESocialContent.VIDEO: [
      {'value': EDurationType.UNDER60S, 'label': "Độ dài dưới 60 giây"},
      {
        'value': EDurationType.FROM1MTO3M,
        'label': "Độ dài từ 1 phút đến 3 phút"
      },
      {
        'value': EDurationType.FROM4MTO10M,
        'label': "Độ dài từ 4 phút tới 10 phút"
      },
      {
        'value': EDurationType.FROM11MTO15M,
        'label': "Độ dài từ 11 phút đến 15 phút"
      },
    ],
    ESocialContent.IMAGE: [
      {'value': EDurationType.TEMPLATE1IMAGE, 'label': "Template 1 hình"},
      {
        'value': EDurationType.CAROUSELMAX10IMAGES,
        'label': "Carousel tối đa 10 hình"
      },
      {
        'value': EDurationType.CAROUSEL11TO35IMAGES,
        'label': "Carousel từ 11 đến 35 hình"
      },
    ],
    ESocialContent.STORY: [
      {'value': EDurationType.LENGTH15S, 'label': "Độ dài 15 giây"},
    ],
  },
  ESocialType.FACEBOOK: {
    ESocialContent.POST: [
      {'value': EDurationType.WITHIMAGE, 'label': "Kèm hình"},
      {
        'value': EDurationType.TEXTONLYNOIMAGE,
        'label': "Chỉ có chữ - KHÔNG kèm hình"
      },
    ],
    ESocialContent.VIDEO: [
      {'value': EDurationType.UNDER60S, 'label': "Độ dài dưới 60 giây"},
      {
        'value': EDurationType.FROM1MTO3M,
        'label': "Độ dài từ 1 phút đến 3 phút"
      },
      {
        'value': EDurationType.FROM3MONWARDS,
        'label': "Độ dài từ 3 phút trở lên"
      },
    ],
    ESocialContent.STORY: [
      {'value': EDurationType.MAX15S, 'label': "Độ dài tối đa 15 giây"},
      {'value': EDurationType.MAX60S, 'label': "Độ dài tối đa 60 giây"},
    ],
  },
  ESocialType.INSTAGRAM: {
    ESocialContent.POST: [
      {'value': EDurationType.ONEIMAGE, 'label': "1 hình"},
      {'value': EDurationType.MAX10IMAGES, 'label': "Tối đa 10 hình/ post"},
    ],
    ESocialContent.STORY: [
      {'value': EDurationType.MAX60S, 'label': "Tối đa 60 giây"},
    ],
    ESocialContent.REEL: [
      {'value': EDurationType.MAX90S, 'label': "Tối đa 90 giây"},
    ],
  },
  ESocialType.YOUTUBE: {
    ESocialContent.VIDEO: [
      {'value': EDurationType.UNDER60S, 'label': "Độ dài dưới 60 giây"},
      {
        'value': EDurationType.FROM1MTO10M,
        'label': "Độ dài từ 1 phút đến 10 phút"
      },
      {
        'value': EDurationType.FROM11MTO30M,
        'label': "Độ dài từ 11 phút đến 30 phút"
      },
      {
        'value': EDurationType.FROM30MONWARDS,
        'label': "Độ dài từ 30 phút trở lên"
      },
    ],
  },
};

// Nhãn nội dung mạng xã hội
final SOCIAL_CONTENT_LABEL = {
  ESocialContent.POST: "Bài đăng",
  ESocialContent.VIDEO: "Video",
  ESocialContent.IMAGE: "Hình ảnh",
  ESocialContent.REEL: "Reel",
  ESocialContent.STORY: "Story",
  ESocialContent.LIVESTREAM: "Livestream",
};

// Trạng thái dự thảo
final TEXT_STATUS_DRAFT = {
  EDraftStatus.FINALIZED: "Đã chấp nhận",
  EDraftStatus.REVIEWED: "Đã xét duyệt",
  EDraftStatus.WAITING: "Chờ xét duyệt",
};

// Lựa chọn lý do từ chối
final REASON_OPTIONS = [
  {'value': ERejectSeason.BUSYSCHEDULE, 'label': "Lịch trình bận rộn"},
  {'value': ERejectSeason.LACKINTEREST, 'label': "Thiếu hứng thú"},
  {'value': ERejectSeason.HEALTHREASONS, 'label': "Lý do sức khỏe"},
  {'value': ERejectSeason.OTHER, 'label': "Khác"},
];

// Lựa chọn lý do báo cáo
final REPORT_REASON_OPTIONS = [
  {'value': EReportReason.FORBIDDENITEM, 'label': "Hàng hóa cấm"},
  {'value': EReportReason.NONCOMPLIANT, 'label': "Không tuân thủ quy định"},
  {'value': EReportReason.SPAM, 'label': "Spam"},
  {'value': EReportReason.HARASSMENT, 'label': "Quấy rối"},
  {'value': EReportReason.HATESPEECH, 'label': "Phát ngôn thù hận"},
  {'value': EReportReason.OFFENSIVE, 'label': "Nội dung xúc phạm"},
  {'value': EReportReason.PORNOGRAPHIC, 'label': "Khiêu dâm"},
];
