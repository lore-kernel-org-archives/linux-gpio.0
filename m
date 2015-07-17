From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: pinconf: Allow groups to be configured via debugfs
Date: Fri, 17 Jul 2015 14:20:02 +0200
Message-ID: <CACRpkdYyMV849ZgXwE-ZJNRZEqrgcDtyzb_TMetoVPP2F_44dw@mail.gmail.com>
References: <1436869079-26594-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35440 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753268AbbGQMUD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2015 08:20:03 -0400
Received: by obbop1 with SMTP id op1so64683599obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2015 05:20:02 -0700 (PDT)
In-Reply-To: <1436869079-26594-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jul 14, 2015 at 12:17 PM, Jon Hunter <jonathanh@nvidia.com> wrote:

> The function pinconf_dbg_config_write() currently only supports configuring
> a pin configuration mapping via the debugfs. Allow group mappings to also
> be configured via the debugfs.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Oh, nice! Patch applied.

Yours,
Linus Walleij
