```mermaid
erDiagram direction TB

    Document {
        string DocID PK "Doc_20250305_001"
        string Title "Tiêu đề tài liệu"
        text Content "Nội dung văn bản từ OCR"
        string FilePath "Đường dẫn file PDF/text"
        string Category "Chủ đề/môn học (ví dụ: Kế toán)"
        datetime CreatedDate "2025-03-05 14:30:00"
    }
   
    Flashcard {
        string FlashID PK "Flash_001"
        string DocID FK "Liên kết với tài liệu gốc"
        text Question "Câu hỏi"
        text Answer "Đáp án"
        datetime CreatedDate "Ngày tạo"
    }

    StudyProgress {
        string ProgressID PK "Prog_20250305_001"
        string FlashID FK "Liên kết với flashcard đã học"
        datetime StudyDate "Ngày học"
        string Status "Trạng thái (Đúng/Sai)"
        integer TimeSpent "Thời gian học (phút)"
    }

    Reminder {
        string ReminderID PK "Rem_001"
        datetime Time "Thời gian nhắc (19:00:00)"
        string Message "Nội dung thông báo"
        boolean IsActive "Trạng thái (1: bật, 0: tắt)"
    }