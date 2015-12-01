From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V4 1/2] pinctrl: intel: fix bug of register offset calculation
Date: Tue, 1 Dec 2015 15:10:40 +0100
Message-ID: <CACRpkdYP6gP9EqF8VHE2RMRY4Kczyitb2tKD0v9Rcwdjr3Ht_A@mail.gmail.com>
References: <1448882416-40845-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33411 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755253AbbLAOKl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 09:10:41 -0500
Received: by obbww6 with SMTP id ww6so5569308obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2015 06:10:40 -0800 (PST)
In-Reply-To: <1448882416-40845-1-git-send-email-qipeng.zha@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, Qi Zheng <qi.zheng@intel.com>

On Mon, Nov 30, 2015 at 12:20 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:

> The group size for registers PADCFGLOCK, HOSTSW_OWN, GPI_IS,
> GPI_IE, are not 24 for Broxton, Add a parameter to allow
> different platform to set correct value.
>
> Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
>
> ---
> change in v4:
>  no code change, re-send because the other patch set is update.

I've already applied the v3 version so no action :)

Yours,
Linus Walleij
