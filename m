From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Sparse GPIO maps with pinctrl-msm.c?
Date: Wed, 14 Jun 2017 13:59:31 -0500
Message-ID: <CAOZdJXUyOAgv1Xs7pk9E4NmX7ZhVaLXOK=CLEy=fa_bS4q-Gig@mail.gmail.com>
References: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50270 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750768AbdFNS7e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2017 14:59:34 -0400
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com [209.85.218.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: timur@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66AF760865
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2017 18:59:33 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id k145so5953443oih.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2017 11:59:33 -0700 (PDT)
In-Reply-To: <CAOZdJXWPEmcw-=P9+q-Zsf4xy9J-ze+W6kUVFi8hLxVH9SGcCA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, linux-gpio@vger.kernel.org, Andy Gross <agross@codeaurora.org>

On Tue, Jun 13, 2017 at 6:35 PM, Timur Tabi <timur@codeaurora.org> wrote:
>
> Is there a way, in pinctrl-msm, to specify a GPIO that doesn't
> actually exist, and therefore should never be exported?

Follow-up question:

In pinctrl-msm, how do pin groups support multiple pins?

struct msm_pingroup {
    const char *name;
    const unsigned *pins;
    unsigned npins;

Here I can specify an array of pins.  However, I can't see from the
code how it would be possible to support more than one pin.  In fact,
all of the drivers that call msm_pinctrl_probe() always set 'npins' to
1 in every group.

Each group represents one GPIO in the TLMM.  All of the TLMM register
definitions are associated with a group, not a pin.  Frankly, it seems
that we should stop pretending that npins can be anything other than
1, and change all the code accordingly.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
