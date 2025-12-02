import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liqui/liqui.dart';

void main() {
  runApp(const LiquiExampleApp());
}

class LiquiExampleApp extends StatelessWidget {
  const LiquiExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Liqui Showcase',
      theme: CupertinoThemeData(brightness: Brightness.light, primaryColor: CupertinoColors.activeBlue),
      home: LiquiShowcasePage(),
    );
  }
}

class LiquiShowcasePage extends StatefulWidget {
  const LiquiShowcasePage({super.key});

  @override
  State<LiquiShowcasePage> createState() => _LiquiShowcasePageState();
}

class _LiquiShowcasePageState extends State<LiquiShowcasePage> {
  String _displayMode = 'show as popover';

  Widget _buildSheetContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 32), // Spacer for alignment
              const Text('Sheet Content', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              LiquiCloseButton(size: 32, onPressed: () => Navigator.pop(context)),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: CupertinoColors.systemGrey6, borderRadius: BorderRadius.circular(16)),
            child: const Column(
              children: [
                Icon(CupertinoIcons.checkmark_circle_fill, size: 64, color: CupertinoColors.activeGreen),
                SizedBox(height: 16),
                Text(
                  'This is a sheet with generic content',
                  style: TextStyle(fontSize: 16, color: CupertinoColors.systemGrey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'You can add any content here',
                  style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey2),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSheet() {
    showLiquiSheet(context: context, backgroundColor: Colors.white, child: _buildSheetContent(context));
  }

  void _showPopover(BuildContext sourceContext) {
    showLiquiPopover(
      context: context,
      sourceContext: sourceContext,
      backgroundColor: Colors.white.withAlpha(240),
      width: 320,
      child: _buildSheetContent(context),
    );
  }

  void _handleOpen(BuildContext context) {
    if (_displayMode == 'show as popover') {
      _showPopover(context);
    } else {
      _showSheet();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Liqui Showcase', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Liqui Components Demo',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: CupertinoColors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Explore popover and sheet presentations with customizable settings',
                  style: TextStyle(fontSize: 16, color: CupertinoColors.systemGrey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Open button on the left
                    LiquiScaleTap(
                      child: Builder(
                        builder: (buttonContext) => CupertinoButton.filled(
                          borderRadius: .all(.circular(99)),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          onPressed: () => _handleOpen(buttonContext),
                          child: const Text('Open', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Circle button group on the right
                    Builder(
                      builder: (settingsContext) {
                        return LiquiCircleButtonGroup(
                          buttons: [
                            // Settings button
                            LiquiCircleButton(
                              icon: CupertinoIcons.settings,
                              onPressed: () {
                                showLiquiMenu(
                                  context: context,
                                  sourceContext: settingsContext,
                                  barrierColor: Colors.transparent,
                                  items: [
                                    LiquiMenuItem(
                                      title: 'Show as popover',
                                      icon: CupertinoIcons.rectangle_on_rectangle,
                                      selected: _displayMode == 'show as popover',
                                      onTap: () {
                                        setState(() => _displayMode = 'show as popover');
                                      },
                                    ),
                                    LiquiMenuItem(
                                      title: 'Show as sheet',
                                      icon: CupertinoIcons.square_list,
                                      selected: _displayMode == 'show as sheet',
                                      onTap: () {
                                        setState(() => _displayMode = 'show as sheet');
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                            // More button
                            LiquiCircleButton(
                              icon: CupertinoIcons.ellipsis,
                              onPressed: () {
                                showLiquiMenu(
                                  context: context,
                                  sourceContext: settingsContext,
                                  barrierColor: Colors.transparent,
                                  items: [
                                    LiquiMenuItem(title: 'Edit', icon: CupertinoIcons.pencil, onTap: () {}),
                                    LiquiMenuItem(title: 'Duplicate', icon: CupertinoIcons.doc_on_doc, onTap: () {}),
                                    LiquiMenuItem(title: 'Share', icon: CupertinoIcons.share, onTap: () {}),
                                    LiquiMenuItem(title: 'Archive', icon: CupertinoIcons.archivebox, onTap: () {}),
                                    LiquiMenuItem(
                                      title: 'Delete',
                                      icon: CupertinoIcons.trash,
                                      destructive: true,
                                      onTap: () {},
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Current mode indicator
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _displayMode == 'show as popover'
                            ? CupertinoIcons.rectangle_on_rectangle
                            : CupertinoIcons.square_list,
                        size: 16,
                        color: CupertinoColors.systemGrey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Current mode: $_displayMode',
                        style: const TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
