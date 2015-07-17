From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: pinconf: Fix display of configs
Date: Fri, 17 Jul 2015 14:21:18 +0200
Message-ID: <CACRpkdbz6C8k+n+rOwWvUHzBSJ3Ba4O2epuvMOGxRWV24OfRzg@mail.gmail.com>
References: <1436869079-26594-1-git-send-email-jonathanh@nvidia.com>
	<1436869079-26594-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:35025 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757222AbbGQMVT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 08:21:19 -0400
Received: by oihq81 with SMTP id q81so69483160oih.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 05:21:18 -0700 (PDT)
In-Reply-To: <1436869079-26594-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jul 14, 2015 at 12:17 PM, Jon Hunter <jonathanh@nvidia.com> wrote:

> The function pinconf_dbg_config_print() only prints the configuration of
> the 1st pin config in an array of pin configurations. Fix this so that
> all pin configurations in the array are displayed.
>
> There are a few places in the code where the pin configs are displayed
> and so add a helper function to display the pin configs to simplify the
> code.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Looks good, patch applied.

Yours,
Linus Walleij
