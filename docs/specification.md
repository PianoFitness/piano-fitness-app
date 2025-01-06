# Piano Fitness App - Software Feature Specification

## Overview
Piano Fitness is a mobile application designed to help piano students develop technical proficiency through focused exercises in coordination and muscle memory. The app emphasizes proper technique, gradual progression, and consistent practice habits.

## Core Features

### Piano Interface
- Interactive 88-key piano visualization
- Calibration system for different keyboard sizes
  - Manual input of key range (e.g., C2 to C6)
  - Auto-calibration by playing lowest and highest keys
- Real-time key press visualization
  - Visual feedback for pressed keys
  - Highlight system for target keys
  - Finger number indicators (1-5) with hand designation (L/R)
- Information display area above piano showing:
  - Current exercise name/description
  - Technical concept being practiced
  - Additional instructions as needed

### Exercise System

#### Exercise Types
1. Scales
   - Major scales
   - Natural minor scales
   - Harmonic minor scales
   - Melodic minor scales
   - Modes (Dorian, Phrygian, etc.)
   
2. Chords
   - Major triads
   - Minor triads
   - Diminished triads
   - Augmented triads
   - Seventh chords
   
3. Chord Inversions
   - First inversion
   - Second inversion
   - Third inversion (for seventh chords)
   
4. Arpeggios
   - Major
   - Minor
   - Diminished
   - Augmented
   
5. Chord Progressions
   - Common progressions (I-IV-V-I, ii-V-I, etc.)
   - Custom progression builder

#### Exercise Configuration
- Key selection (all major and minor keys)
- Tempo settings (40-208 BPM)
- Practice mode selection:
  - Hands separate
  - Hands together
  - Custom hand patterns
- Exercise difficulty levels
  - Beginner
  - Intermediate
  - Advanced

### Practice Tools

#### Metronome
- Adjustable tempo (40-208 BPM)
- Multiple time signatures
- Customizable sounds:
  - Click
  - Bell
  - Wood block
  - Digital beep
- Visual pulse indicator
- Tap tempo feature

#### Session Timer
- Practice duration tracking
- Session goals
- Break reminders
- Resume functionality

### Progress Tracking

#### Analytics Dashboard
- Practice time statistics
  - Daily/weekly/monthly totals
  - Exercise-specific time tracking
- Performance metrics
  - Tempo progression
  - Accuracy rates
  - Legato consistency scores
- Progress visualization
  - Performance graphs
  - Achievement unlocks
  - Milestone tracking

#### Practice Calendar
- Heat map visualization
- Streak tracking
- Daily practice goals
- Historical practice log

## Technical Requirements

### Platform
- Mobile (iOS and Android)
- Minimum OS versions:
  - iOS 14.0+
  - Android 8.0+

### Technology Stack
- Godot 4 Game Engine
- GDScript for core functionality
- C++ for performance-critical components

### Hardware Requirements
- MIDI input support
  - USB MIDI
  - Bluetooth MIDI
  - MIDI over USB OTG
- Minimum device specifications:
  - 2GB RAM
  - 100MB storage
  - OpenGL ES 3.0 support

## Anti-Features
The following features are explicitly excluded from the scope:

### Audio Recognition
- No acoustic piano detection
- No audio-based feedback
- No pitch detection

### Repertoire
- No sheet music
- No song library
- No performance pieces

### Ear Training
- No interval recognition
- No chord recognition
- No melodic dictation
- No rhythm training

### Music Notation
- No sheet music rendering
- No score display
- No notation input/editing

## Future Considerations

### Potential Extensions
- Cloud sync for progress data
- Social features (practice buddies, challenges)
- Teacher dashboard for student monitoring
- Custom exercise creation tools
- Advanced analytics export
- Practice routine templates

### Performance Optimization
- Minimize input latency
- Efficient MIDI processing
- Battery usage optimization
- Memory footprint management

## Development Priorities

### Phase 1 (MVP)
1. Basic piano interface
2. MIDI input processing
3. Simple exercise system (scales and triads)
4. Basic metronome
5. Session timer

### Phase 2
1. Extended exercise library
2. Progress tracking
3. Analytics dashboard
4. Practice calendar
5. Advanced configuration options

### Phase 3
1. Performance optimization
2. Advanced analytics
3. Social features
4. Cloud sync
5. Custom exercise builder
