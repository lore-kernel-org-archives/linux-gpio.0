From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] pinctrl: intel: Only restore pins that are used by the driver
Date: Tue, 11 Oct 2016 09:31:18 +0800
Message-ID: <CAFv23Qn+dDRyGutHBh0FfXRBZCmfTf_B0bQy-E-bb+4Nx+Xx2Q@mail.gmail.com>
References: <CAFv23Q=_wSqhBE9ni9YmtxyEKFSENLYZ512Ent9iyWd7hv3gYg@mail.gmail.com>
 <20161010133931.88055-1-mika.westerberg@linux.intel.com> <0e3bf0b8c82d4c3ca6d753abfd1063bf@ausx13mpc124.AMER.DELL.COM>
 <20161010145346.GI30800@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:35669 "EHLO
        mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752903AbcJKBbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Oct 2016 21:31:22 -0400
Received: by mail-qk0-f174.google.com with SMTP id z190so9636765qkc.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Oct 2016 18:31:20 -0700 (PDT)
In-Reply-To: <20161010145346.GI30800@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario.Limonciello@dell.com, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Calvin Johnson <linux.cj@gmail.com>, Jared.Dominguez@dell.com, linux-gpio@vger.kernel.org

Hi Mika,

Yes, the patch works, the touchscreen continue working after lid close and open.
Thanks for your work.

Best regards,
AceLan Kao.

2016-10-10 22:53 GMT+08:00 Mika Westerberg <mika.westerberg@linux.intel.com>:
> On Mon, Oct 10, 2016 at 02:37:19PM +0000, Mario.Limonciello@dell.com wrote:
>> After positive comments in this working properly and is accepted, would you
>> consider submitting back to @stable as well?  It affects all kernel versions
>> that carry intel pinctrl (IIRC back to 4.1?)
>
> Sure.
>
> LinusW, this should have stable tag starting from v4.1. Let me know if
> you want me to re-submit the patch.
