From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [ANNOUNCE] libgpiod v0.3
Date: Fri, 23 Jun 2017 17:18:15 +0200
Message-ID: <CAMRc=MeLYvdmdopir8QppEwm7z3g_ROWWX7vjUrvx_y6MP4Tpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36822 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753397AbdFWPSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2017 11:18:16 -0400
Received: by mail-oi0-f43.google.com with SMTP id p187so27181267oif.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2017 08:18:16 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

libgpiod v0.3 has been released and is available from github[1].

This will be the last release in the 0.x series as I now want to
introduce backwards-incompatible changes in the API that will fix
certain bad design issues.

New features:
- gpiomon can now watch multiple lines at the same time and supports custom
  output formats which can be specified using the --format argument
- testing framework can now test external programs: test cases for gpio-tools
  have been added

Improvements:
- improve error messages
- improve README examples
- configure script improvements

Bug fixes:
- use correct UAPI flags when requesting line events

Best regards,
Bartosz Golaszewski

[1] https://github.com/brgl/libgpiod/releases/tag/v0.3
