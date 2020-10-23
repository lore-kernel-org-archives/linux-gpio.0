Return-Path: <SRS0=BpRQ=D6=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69999C388F9
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Oct 2020 17:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 119F420EDD
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Oct 2020 17:10:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhZc6fuX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753083AbgJWRKC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 23 Oct 2020 13:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753081AbgJWRKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 13:10:01 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1ACBC0613CE;
        Fri, 23 Oct 2020 10:10:01 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id bh6so1242481plb.5;
        Fri, 23 Oct 2020 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GdRPgWyXyxTy0P4KdzcdBjucddH09mdHnx2CBN2dStc=;
        b=WhZc6fuXGE8B3oDZ4oY5c7YkM6QtEqOmiYLApRmRA6Pq85VHOdc0wypq2WBa2oGbKl
         gK3P6k8oOtepvjm+b/oNMCVW4q2Qs/B5VOcnUE6bYY32eR90hwFjlN8HmFCrUetumEzn
         Uy+mA5ef4JsyecJeCUxTw6G4NK8UcPsTpWaVmHL9mMSLyaUaVFbVFg6B1ixBjS4LBZLi
         evakWjz82ncSJfATkX1ES8uiU8xKZPajliktYBIXA6sFuIQrm25olj7qVmMSodmOeKH1
         EskgASicNmM1onIIy0zl8lidViujZsBw/uXRxKoddXUUMSak4PeCeSG/irOAXCstgru9
         PqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GdRPgWyXyxTy0P4KdzcdBjucddH09mdHnx2CBN2dStc=;
        b=lDu18ZqVJ8QlGSN/uvLc/Wynj8MY0Py3bwkbf5HRuh7OZhZnru1eMZq3zeaq5jaKYW
         K87MV3fFfM7jWVLSyJC27CYdp0ifjvjbAC1N3clN5cFGw8/PbEuLZHajY9FOTrR2vhXp
         5YRl+2VPafRFB/bfoYgDa02ILYSLxBqQWqHQw86CngvcvalbVZqjPbus5hQT+NsVJ+Ba
         dZfhdqcJ/JTMyBC8IcEpVfNJunCsRE08YAHTzBBsHJWjCyHzlVjMQYCffZq9P10Z5MpF
         v32KotS/5lnMOwYMveixx8DfX+5rA3sFqwM7WJN/3rAkSyoWWV5c/Uaylg9ZBwx9qyJw
         BtKg==
X-Gm-Message-State: AOAM533ZoTZr69b61lXqQvoklai5v5ngLWak4SYhiUfYpkNF4bwVWDPr
        XlTo/6l4gG/r2GkppOGCprl8zrom05lKsEWtt/o=
X-Google-Smtp-Source: ABdhPJwzWnU0rQmufhkd077MFq88tSpOi8mjdjBrW+vHI6/mVMYY2kvy8/3npLWNtkUbB1z3Lpz51oDotWVVaW8abts=
X-Received: by 2002:a17:902:ea8c:b029:d2:8abd:c8de with SMTP id
 x12-20020a170902ea8cb02900d28abdc8demr3348650plb.21.1603473001105; Fri, 23
 Oct 2020 10:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
In-Reply-To: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Oct 2020 20:10:50 +0300
Message-ID: <CAHp75VeNLmvasfg_9xGEGGM=sXqJdzk0a2ndRRMZ-i+mKh05AQ@mail.gmail.com>
Subject: Re: Request for pre-review of pending MID removal patch series
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: Bart (sorry, forgot to include you)

On Fri, Oct 23, 2020 at 8:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Hi!
>
> There is a pending patch series [1] to remove a lot of legacy code
> related to old Intel MID platforms. (Note, not all of them, since we
> have an ACPI based Intel Edison edition which continue working nicely
> after this)
>
> Most of the code is shuffling arch/x86 and the series is quite
> dependent on the contents of that folder (for the sake of
> bisectability). Since that the only way it would be integrated is
> through the tip tree I would like to have your preliminary review on
> other contents =E2=80=94 #3 and #4 are PDx86 and GPIO subsystems. In this=
 case
> I won't resend this many times.
>
> I have a preliminary offline agreement with Len Brown on SFI removal
> (#2 in the list).
>
> [1]: https://gitlab.com/andy-shev/next/-/commits/topic/mid-removal/
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
With Best Regards,
Andy Shevchenko
