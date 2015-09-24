From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drivers: field for new GPIO driver
Date: Thu, 24 Sep 2015 15:26:12 -0700
Message-ID: <CACRpkdbARoWp57jx830qtpFQ2NNWNMeoRR2rAiwOfaV059iryw@mail.gmail.com>
References: <006001d0f525$deaeff30$9c0cfd90$@asmedia.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:35948 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754037AbbIXW0N (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 18:26:13 -0400
Received: by obbmp4 with SMTP id mp4so69551296obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2015 15:26:12 -0700 (PDT)
In-Reply-To: <006001d0f525$deaeff30$9c0cfd90$@asmedia.com.tw>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: yd_tseng@asmedia.com.tw, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, =?UTF-8?B?VHVuZ1l1IEx1KOWRguadseaYsSk=?= <TungYu_Lu@asmedia.com.tw>, Dirk Behme <dirk.behme@de.bosch.com>

On Tue, Sep 22, 2015 at 4:00 AM, yd_tseng <yd_tseng@asmedia.com.tw> wrote:

Hi,

> This patch adds a new GPIO driver for AMD Promontory chip.  This GPIO
> controller is enumerated by ACPI and the ACPI compliant hardware ID is
> AMDF030.  And the patch file is also attached.

This isn't really working:
X-Mailer: Microsoft Outlook 14.0

Outlook is mangling the patches, please try to figure out how to send patches
using git send-email at your company, also read:
Documentation/SubmittingPatches
Documentation/email-clients.txt

Before posting.

Then send the patch to me, Alexandre, and the linux-gpio@vger.kernel.org
mailing list, as indicated in the MAINTAINERS file.

In this case, also include Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
as he is the author of a previous AMD GPIO driver. Is this hardware really
different or can the old driver be augmented to handle both?

There are some issues with the driver, such as functions being named
*pinctrl* though it seems to be a clean GPIO driver, so rename these
functions. The rest of the review I save for the next posting.

Yours,
Linus Walleij
