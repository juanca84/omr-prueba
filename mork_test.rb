require 'mork'
include Mork

content = [
  {
    choices: [4] * 100,
    barcode: 1001,
    header: { name: 'John Doe UI354320', title: 'Final exam', code:  '1001'}
  },
  {
    choices: [4] * 100,
    barcode: 1002,
    header: { name: 'Jane Roe UI354321', title: 'Final exam', code:  '1002'}
  }
]

layout = {
  # page_size: {
  #   width: 220,   # width of the paper sheet
  #   height: 280,    # height of the paper sheet
  # },
  header: {
    name:  { top:  5, left:  15, width: 160, height:  7, size: 14 },
    title: { top: 15, left:  15, width: 160, height: 12, size: 12 },
    code:  { top: 15, left: 155, width:  35, height: 10, size: 14 }
  },
  # items: {
  #   threshold:      0.75, # mark detection threshold (*)
  #   columns:        4,    # number of columns
  #   column_width:  44,    #
  #   rows:          25,    # number of items per column
  #   left:          11,    # response area margin, relative to reg frame
  #   top:           55,    # response area margin, relative to reg frame
  #   x_spacing:      7,    # horizontal distance between ajacent cell centers
  #   y_spacing:      7,    # vertical distance between ajacent cell centers
  #   cell_width:     6,    # width of each choice and calibration cell
  #   cell_height:    5,    # height of each choice and calibration cell
  #   max_cells:      5,    # the maximum number of choices per question
  #   font_size:      9,   # for the question number and choice letters
  #   number_width:   8,    # width of question number text box
  #   number_margin:  2    # distance betw
  # },
  # barcode: {
  #   bits:          20,    # the maximum sheet identifier is 2 to the power or bits
  #   left:          10,    # distance between registration frame side and the first barcode bit
  #   width:          1,    # width of each barcode bit
  #   height:         2,    # height of each barcode bit from the registration frame bottom side
  #   spacing:        0.5
  # }
}

sheet = SheetPDF.new content, layout
sheet.save 'sheet2.pdf'
system 'open sheet.pdf' # this works in OSX

s = SheetOMR.new 'image7.jpeg'

respuesta = ['A','B','C','D']
if s.set_choices [5] * 120
  puts s.marked_choices.inspect
  #s.marked_choices.each do |mc|
    #puts respuesta[0]
  #end
else
  puts "The sheet is not registered!"
end

# puts s.barcode
# s.overlay :check, :marked
# s.save 'marked_choices.jpg'
