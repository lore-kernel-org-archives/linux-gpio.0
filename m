From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/4] Trivial GPIO/pinctrl documentation fixes
Date: Fri, 10 Jun 2016 16:46:32 +0930
Message-ID: <1465542996-12534-1-git-send-email-andrew@aj.id.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:57973 "EHLO
	homiemail-a22.g.dreamhost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750710AbcFJHRI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 10 Jun 2016 03:17:08 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, Andrew Jeffery <andrew@aj.id.au>

Hi all,

The patches fix some file paths and minor grammatical issues in the
GPIO/pinctrl documentation. Patches 3 and 4 are separate to ease review.

Cheers,

Andrew

Andrew Jeffery (4):
  drivers-on-gpio.txt: Fix paths to GPIO driver source files
  pinctrl.txt: Fix grammar in pinmux request list
  pinctrl.txt: s/have/has/ in GPIO driver interaction description
  pinctrl.txt: Reflow/wrap paragraph describing GPIO interaction

 Documentation/gpio/drivers-on-gpio.txt | 13 +++++++------
 Documentation/pinctrl.txt              | 22 +++++++++++-----------
 2 files changed, 18 insertions(+), 17 deletions(-)

-- 
2.7.4

