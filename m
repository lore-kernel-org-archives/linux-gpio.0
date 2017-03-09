From: Robert Middleton <robert.middleton@rm5248.com>
Subject: Re: PATCH v2
Date: Thu, 9 Mar 2017 11:37:16 -0500
Message-ID: <CAKpcJVZ-rw=-dHSSy4bF8cMMVL=o7COnMrSdpvse84BtFx8gbA@mail.gmail.com>
References: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sub5.mail.dreamhost.com ([208.113.200.129]:41051 "EHLO
        homiemail-a83.g.dreamhost.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754746AbdCIQha (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2017 11:37:30 -0500
Received: from homiemail-a83.g.dreamhost.com (localhost [127.0.0.1])
        by homiemail-a83.g.dreamhost.com (Postfix) with ESMTP id 3D99E8018C39
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2017 08:37:19 -0800 (PST)
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com [209.85.217.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: robert.middleton@rm5248.com)
        by homiemail-a83.g.dreamhost.com (Postfix) with ESMTPSA id 1C4218018C2E
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2017 08:37:19 -0800 (PST)
Received: by mail-ua0-f169.google.com with SMTP id q7so70614352uaf.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Mar 2017 08:37:19 -0800 (PST)
In-Reply-To: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

On Wed, Feb 22, 2017 at 10:34 AM,  <robert.middleton@rm5248.com> wrote:
>
> This v2 patch changes the MCP23S08 interrupt logic to ensure that if multiple
> inputs are changed at the same time, the kernel will be notified of all
> the pins that changed.
>
> I added several variables to the irq handler, however this means that there
> are now quite a few local variables(possibly too many, as the kernel coding
> standard says that more than 5-10 is probably too many:
> https://www.kernel.org/doc/Documentation/process/coding-style.rst).  I'm
> not sure what the best way to fix this is, or if it has to be fixed.
>
> -Robert Middleton
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hi, I would like to try and get some verification here on if this patch
is a good fix or not.  I have done testing on my side, and was
wondering if there was something else that I had to do in order to have
this patched upstream.

-Robert Middleton
