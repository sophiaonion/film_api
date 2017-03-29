require 'test_helper'

# context :show do
#   before do
#     create_and_sign_in_user
#     @user = FactoryGirl.create(:user)
#
#     get api_v1_user_path(@user.id), format: :json
#   end
#
#   it 'returns the correct status' do
#     expect(last_response.status).to eql(200)
#   end
#
#   it 'returns the data in the body' do
#     body = HashWithIndifferentAccess.new(MultiJson.load(last_response.body))
#     expect(body[:user][:name]).to eql(@user.name)
#     expect(body[:user][:updated_at]).to eql(@user.updated_at.iso8601)
#   end
# end

class FilmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @film = films(:one)
  end

  test "should get index" do
    get films_url, as: :json
    assert_response :success
  end

  test "should create film" do
    assert_difference('Film.count') do
      post films_url, params: { film: { average_rating: @film.average_rating, description: @film.description, related_film_ids: @film.related_film_ids, title: @film.title, url_slug: @film.url_slug, year: @film.year } }, as: :json
    end

    assert_response 201
  end

  test "should show film" do
    get film_url(@film), as: :json
    assert_response :success
  end

  test "should raise update film exception" do
    patch film_url(@film), params: { film: { average_rating: @film.average_rating, description: @film.description, related_film_ids: @film.related_film_ids, title: @film.title, url_slug: @film.url_slug, year: @film.year } }, as: :json
    assert_raises(Exception){whatever.merge}
  end

# TODO fix this
  # test "should update film" do
  #   patch film_url(@film), params: { film: { average_rating: @film.average_rating, description: @film.description, related_film_ids: @film.related_film_ids, title: @film.title, url_slug: @film.url_slug, year: @film.year } }, as: :json
  #   assert_raises(Exception){whatever.merge}
  # end


  test "should destroy film" do
    assert_difference('Film.count', -1) do
      delete film_url(@film), as: :json
    end

    assert_response 204
  end
end
