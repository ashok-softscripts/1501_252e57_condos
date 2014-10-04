if Rails.env!="development"
	WickedPdf.config = { :wkhtmltopdf => Rails.root.join('bin', 'wkhtmltopdf').to_s }
end