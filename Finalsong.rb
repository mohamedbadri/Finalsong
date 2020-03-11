# Welcome to Sonic Pi v3.1
sad="C:/Users/mohamed_badri/Documents/Audacity/sad.wav"
win="C:/Users/mohamed_badri/Documents/Audacity/breth.wav"
fear="C:/Users/mohamed_badri/Documents/Audacity/short.wav"
out="C:/Users/mohamed_badri/Documents/Audacity/thx.wav"
intro="C:/Users/mohamed_badri/Documents/Audacity/intro.wav"
happy="C:/Users/mohamed_badri/Documents/Audacity/happy.wav"
free="C:/Users/mohamed_badri/Documents/Audacity/doufree.wav"
bills="C:/Users/mohamed_badri/Documents/Audacity/freefrombills.wav"
love="C:/Users/mohamed_badri/Documents/Audacity/freetolove.wav"
bars="C:/Users/mohamed_badri/Documents/Audacity/freefrombars.wav"
sing="C:/Users/mohamed_badri/Documents/Audacity/freetosing.wav"
scares="C:/Users/mohamed_badri/Documents/Audacity/freefromscares.wav"
pain="C:/Users/mohamed_badri/Documents/Audacity/freefrompain.wav"
background="C:/Users/mohamed_badri/Documents/Audacity/background.wav"
ican="C:/Users/mohamed_badri/Documents/Audacity/icaniwillimust.wav"
chosen=dice(2)-1
define :p_f do |x,y,z,a|
  play x, sustain: 3, amp: 0.5
  play y, sustain: 3, amp: 0.5
  play z, sustain: 3, amp: 0.5
  sleep a
end
sample intro, amp: 2
sleep 30.4
sample free, amp: 2
sleep 6
live_loop :background do
  12.times do#transition into fear
    sample background
    sleep 3
  end
  stop
end
use_synth :piano
x=0
transition=[:a4, :f4, :g4, :c4, :f3, :d3]
3.times do
  play :b4
  sleep 1
end
live_loop :intro do
  4.times do #transpozing music
    6.times do
      play transition
      x=x+1
    end
    if x == 6
      x=0
    end
    sleep 0.50
    play :a4, sustain: 3, amp: 0.5
    sleep 0.25
    play :a4, sustain: 3, amp: 0.5
    sleep 0.25
    play :r
    sleep 0.5
    play :g4, sustain: 3, amp: 0.5
    sleep 0.25
    play :g4, sustain: 3, amp: 0.5
    sleep 0.25
    p_f :g4, :d4, :c4, 0.5
    play :f4, sustain: 3, amp: 0.5
    sleep 1
    play :r
    p_f :g3, :e3, :a2, 0.25
    p_f :e4, :d4, :c4, 1
    chosen=dice(6)-1#is randamized
    random_sample=[bills,love,bars,sing,scares,pain]
    sample random_sample[chosen], amp: 1
    sleep 2
  end
  stop
end
sleep 35
sample fear, amp: 2
sample sad
sleep 5
live_loop :wind do
  10.times do #plays behind sample sad
    sample :ambi_dark_woosh, amp: 0.5, rate: 0.5
    sleep 0.5
    sample :ambi_piano, amp: 0.5, rate: 0.5
    sleep 0.5
    sample :ambi_choir, amp: 0.5, rate: 0.3
    sleep 0.5
  end
  stop
end
sleep 24
sample win #transition to eye of the tiger
sleep 7.7
sample ican
sleep 12
use_synth :pluck
live_loop :back do
  176.times do
    amps = (ring 1, 0.5, 0.5, 0.5, 0.75, 0.5, 0.5, 0.5)
    play :C2, attack: 0.05, release: 0.4
    sleep 0.25
  end
  stop
end
sleep 4
#is eye of the tiger
sample  :drum_cymbal_open, beat_stretch: 10, rate: -1, amp: 2
sleep 10
use_synth :fm
use_synth_defaults amp: 2
#dase for eye of the tiger
with_fx :distortion, distort: 0.6 do
  3.times do
    cue :bam
    play [:C4, :Eb4, :G4, :C5], release: 0.5
    sleep 1
    2.times do
      cue :bam
      play [:C4, :Eb4, :G4, :C5], release: 0.5
      sleep 0.5
      cue :bam
      play [:Bb3, :D4, :F4, :Bb4], release: 0.5
      sleep 0.5
      cue :bam
      play [:C4, :Eb4, :G4, :C5], release: 0.5
      sleep 1
    end
    cue :bam
    play [:C4, :Eb4, :G4, :C5], release: 0.5
    sleep 0.75
    cue :bam
    play [:G3, :Bb3, :Eb4, :G4], release: 0.5
    sleep 0.75
    cue :bam
    play [:Ab3, :C4, :Eb4, :Ab4], release: 4.5
    sleep 4
  end
end
sleep 2
sample out, amp: 6










