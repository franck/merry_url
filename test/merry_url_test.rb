require 'test_helper'

MerryUrl::BIT_LY_LOGIN = "bitlyapidemo"
MerryUrl::BIT_LY_KEY = "R_0da49e0a9118ff35f52f629d2d71bf07"

class MerryUrlTest < Test::Unit::TestCase
  GOOGLE_URL = "http://www.google.fr"
  GOOGLE_TINY_URL = "http://tinyurl.com/6d3x"
  GOOGLE_IS_GD_URL = "http://is.gd/3CE62"
  GOOGLE_BIT_LY_URL = "http://bit.ly/12YAo"
  WRONG_URL = "google.fr"

  context "tiny_url" do
    should "shorten a correct url" do
      assert_equal GOOGLE_TINY_URL, MerryUrl.tiny_url(GOOGLE_URL)
    end
    
    should "raise a exception when url is wrong" do
      assert_raise MerryUrl::MerryUrlError do
        MerryUrl.tiny_url(WRONG_URL)
      end
    end
    
  end

  context "is.gd" do
    should "shorten a correct url" do
      assert_equal GOOGLE_IS_GD_URL, MerryUrl.is_gd(GOOGLE_URL)
    end
    
    should "raise a exception when url is wrong" do
      assert_raise MerryUrl::MerryUrlError do
        MerryUrl.is_gd(WRONG_URL)
      end
    end
  end
  
  context "bit.ly" do
    should "shorten a correct url" do
      assert_equal GOOGLE_BIT_LY_URL, MerryUrl.bit_ly(GOOGLE_URL)
    end
    
    should "raise a exception when url is wrong" do
      assert_raise MerryUrl::MerryUrlError do
        MerryUrl.is_gd(WRONG_URL)
      end
    end
  end
    
end
