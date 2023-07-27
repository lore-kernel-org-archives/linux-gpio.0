Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3716EB64DD
	for <linux-gpio@archiver.kernel.org>; Thu, 27 Jul 2023 22:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbjG0WLO (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 27 Jul 2023 18:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjG0WLO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 18:11:14 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571A6271E
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 15:11:13 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-40398ccdaeeso8072721cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 15:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690495872; x=1691100672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEh7JReNRZOP+ZRbj/0ebr1DojcV2uFwlOYTP1QsgQ0=;
        b=oefp9HHuDc+4ygSk83D2X0OL0jdkqWfzW2c9ldsTl1SysCOo5A8U58PIgBY8RDEskz
         KW9HOzQ/c6uqb+jSXqemjeHDz11oCA3SArc6wHzT9wp1FGX2hXze6aWxKfGihuzaJ0vr
         JMp8tcOznYTfl7TKCT//I/KGWsmexNVL442HLY4hR+yOcPhc9XAyFiMnW/IuuGNBFGcx
         tGPjBBo+2aKSeo3ClwO+59oRYiOAkFqvsB1Haxlvt3Et/ZWkxfKJZBlWFJlomd+Nv7ns
         w9XcSSPMa8Dyh9IytQcPzq6oMWhV3xYgtIS1AXnlqSIu7F8dEAe5qLSf6zvuIWOjBWDs
         DJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690495872; x=1691100672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEh7JReNRZOP+ZRbj/0ebr1DojcV2uFwlOYTP1QsgQ0=;
        b=cpgY6qLVIdX+HsmBCjI4ayC5qDm2pPmUlm6jOpUh6yHIGNPvK+emEgaqADFLEu7pZ5
         AXDmgcTpJU6EpyxdkEeq/3TKzY8PCdr1ZKB/+90XMpyGYzQ/0Ft7jri2eN8aaA0xn2Mk
         VvVTyMlzqJjQWqqDB2VVG7jtWLbzHuAD2n0NwFxlHjamRHGuQHA/7una95NFL5sumeKR
         S9EXomZj3QCiMddN3cBJ1pQLKPfIKQSAfDiT6cALP/4BCzY0IydTadkEcnYIk5sQ+wTA
         GZlTYMhxpqAnS4phkoftXUbW+VFRUlhnufbx2/THXo+Gx6fnAQ67niczd/EQabXPS3ZQ
         UsxQ==
X-Gm-Message-State: ABy/qLbiGxLClf5snZ0Br+jjaiHjrYU/gP8Xprinkudk4XAE0AF2IdVc
        b0/Jd2beF8Xtxy6UfeEJSAUu+9l4KtytlWm13nTOufOjq/Y=
X-Google-Smtp-Source: APBJJlEl1jTZAcZjAEbR/l5t14wmDwcR/n/jhVmZRuFxeCeNwTaJOGfRihSqR/SIVRKxLRdU7GSkjBDkyVKr4wtvcQw=
X-Received: by 2002:ac8:5915:0:b0:400:aaaf:cf0b with SMTP id
 21-20020ac85915000000b00400aaafcf0bmr1057039qty.4.1690495872435; Thu, 27 Jul
 2023 15:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol> <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol>
In-Reply-To: <ZMLnz25brQvcwBVW@sol>
From:   andy pugh <bodgesoc@gmail.com>
Date:   Thu, 27 Jul 2023 23:10:36 +0100
Message-ID: <CAN1+YZVv6gkZT6yHH8fedSAbMCg0EXPWVbbEJPGNmVp9Uhgkdg@mail.gmail.com>
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 27 Jul 2023 at 22:55, Kent Gibson <warthog618@gmail.com> wrote:

> On a Pi is it significantly faster to go direct to hardware using
> /dev/gpiomem, rather than going via the kernel as libgpiod does.
> I do my best to avoid using gpiomem these days, but if you really need to
> minimize CPU cycles or latency then that is another option.

The existing driver uses gpiomem, but the interface used seems to not
be set up in Debian Bookworm.
It might be available in _Raspbian_ but that current Raspbian version
is based on Bullseye (or Buster)

https://github.com/LinuxCNC/linuxcnc/issues/2371

Is where the suggestion was made to try gpiod, initially because of a
problem with the way we were detecting Pi versions, but then because
gpiomem wasn't there.

(It can probably be configured, but we have a user base largely made
of machinists, not Linux enthusiasts)

--=20
atp
"A motorcycle is a bicycle with a pandemonium attachment and is
designed for the especial use of mechanical geniuses, daredevils and
lunatics."
=E2=80=94 George Fitch, Atlanta Constitution Newspaper, 1912
