body =
  "今晩は久しぶりに神宮で野球観戦。内野B席の上段に着席。\n\n" +
  "先発はヤクルトがキャナン、広島はジョンソン。" +
  "二回裏に中村選手のセーフティスクイズなどでヤクルトが三点を先取。" +
  "そして、8回裏には代打・荒木選手がレフトスタンドへ2塁満点ホームラン。\n\n" +
  "プキャナン選手の今季完封を見届けて、気分良く家路に着きました。"

%w(Taro Jiro Hana).each do |name|
  member = Member.find_by(name: name)
  0.upto(9) do |idx|
    entry = Entry.create(
        author: member,
        title: "野球観戦#{idx}",
        body: body,
        posted_at: 10.days.ago.advance(days: idx),
        status: %w(draft member_only public)[idx % 3])
    if idx == 7 || idx == 8                  # 以下を追加
      %w(John Mike Sophy).each do |name2|
        voter = Member.find_by(name: name2)  # entryの作成時にmemberを
        voter.voted_entries << entry
      end
    end
  end
end