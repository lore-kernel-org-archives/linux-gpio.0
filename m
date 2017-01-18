From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Crash in kernel/locking/rtmutex.c
Date: Wed, 18 Jan 2017 09:49:34 +0100
Message-ID: <CACRpkdbxZw6QLKA0A8b=VuHmtkSHFywDT19pFZ3ioQ0kA=3VNg@mail.gmail.com>
References: <CAEYdEeQ63HZzi8yJk4eAAa=XeEeOFR_wqnL_PW3d6Nt5N955pQ@mail.gmail.com>
 <20170117201906.GB1335@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:34170 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751790AbdARItf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2017 03:49:35 -0500
Received: by mail-qt0-f174.google.com with SMTP id l7so5642386qtd.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2017 00:49:35 -0800 (PST)
In-Reply-To: <20170117201906.GB1335@jcartwri.amer.corp.natinst.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: Brian Wrenn <dcbrianw@gmail.com>, linux-rt-users@vger.kernel.org, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

On Tue, Jan 17, 2017 at 9:19 PM, Julia Cartwright <julia@ni.com> wrote:

> Can you give the following patch a try?  Even though this problem is
> only observable on -rt kernels, the below patch is suitable for
> inclusion in mainline.  (The below is ontop of -next, you may have to
> finnagle it a bit to work on the linaro frankenkernel).

This looks like one of the RT cases pointed out by Grygorii i
Documentation/gpio/driver.txt
and the patch looks fine.

Once you have confirmation that it solves the problem, add
a Tested-by: tag and send to the GPIO mailinglist & me and
make sure to get Bj=C3=B6rn Andersson on the CC so he can review
it swiftly.

Yours,
Linus Walleij
