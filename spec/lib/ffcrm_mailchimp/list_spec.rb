require 'spec_helper'

describe FfcrmMailchimp::List do

  let(:lists) { FactoryGirl.build_list(:list, 2) }

  before { FfcrmMailchimp::List.stub(:lists_from_mailchimp).and_return( {"data" => lists} ) }

  context "when initialized" do
    let(:list) { FfcrmMailchimp::List.new('123', 'test') }
    it { expect( list.id ).to eql('123') }
    it { expect( list.name ).to eql('test') }
  end

  describe ".lists" do
    context "when mailchimp lists exist" do
      it { expect( FfcrmMailchimp::List.lists.count ).to eql( 2 ) }
    end
    context "when no mailchimp lists" do
      let(:lists) { [] }
      it { expect( FfcrmMailchimp::List.lists.count ).to eql( 0 ) }
    end
  end

  describe ".collection_for_select" do
    it "should return only id and name" do
      all_result = FfcrmMailchimp::List.collection_for_select
      expect( all_result ).to_not be_empty
      expect( all_result.first.count ).to eql( 2 )
      expect( all_result.last.count ).to  eql( 2 )
      expect( all_result.class).to eql(Array)
    end
  end

  describe ".find(id)" do
    it "should return list for the given id" do
      id = lists.first[:id]
      list_by_id = FfcrmMailchimp::List.find( id )
      list_by_id.should be_kind_of FfcrmMailchimp::List
      list_by_id.name.should_not be_blank
    end
  end

  describe ".group" do
    context "when list id given" do
      it "should return all groups" do

      end
      it "should return nil if no group available" do
      end
      it "should return empty hash if no list id passed" do
      end
    end
  end
end
