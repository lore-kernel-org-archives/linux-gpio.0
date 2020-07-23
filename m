Return-Path: <SRS0=rd0Y=BC=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A29C433E1
	for <linux-gpio@archiver.kernel.org>; Thu, 23 Jul 2020 13:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8BA920737
	for <linux-gpio@archiver.kernel.org>; Thu, 23 Jul 2020 13:18:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mp0kBnTT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgGWNSy (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 23 Jul 2020 09:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgGWNSx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 09:18:53 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEC4C0619DC
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:18:53 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e8so6327529ljb.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+1th+BHBGAVFwVQRrPTg7EsduOkA9h4dOP9oDk2Wpo=;
        b=mp0kBnTT/oDNmLelxyI9ceCXfTdWxlDpEOdsLu8TMyjwkvIBxbGXeK+YWU0BeFgL5O
         frxtx+bYZCBkw5ZMi0CCwzY2OdP75L39skCJFeN+FCkQdjhA6ICmemHAfi0vtLYUrXH9
         bS90oCogvQbo4IeY4DpZvp6Xd3VpC3QEjIqIIOuVEyueHGLxTbwqizNtaWNkrORblofs
         A6oiJq/RHzS+n4AJ1V6Oc9C30ubTpImbWo2J2YaSqCMybXR+mpmFX0GLsJgeapGOJpMe
         FjpXZk9DK6I6yZ34d3vdC9PdL9265C/uTlIfi9DgMB9soSzg/jf0urSqBeUnkPK9e1za
         7Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+1th+BHBGAVFwVQRrPTg7EsduOkA9h4dOP9oDk2Wpo=;
        b=YNJyQMZcOGXDuwX4U6FxpvbWzUp8tlBuavLUSQdeBocMXilWx5t1q4OGIj7UqRPCXM
         XZr+H1mcAm/xJdyV02H1R9hGH44FSbmVoeEEyJq6Zyl6/uI5JC3FWZVOdFIt1o/6tsN4
         lfx6pGFrrRBkJO2FnjDU2iD0NN63jaXAb4GHQRycsl6O7Dsa3RmMyIGXVnYjHrxoYG2P
         72jMpmNhhELJhzAtC7YVfG9qQHKTbucRd1ijU2oaFwLL/g6CAYNAf558EF4ZJT3alyun
         sQ+quoJg+AuIs41c7RIO+CMRo2OK9M8uPJIz5KjWh5xMCgRDAbUkuHQk9rf1tbElpgip
         0cgA==
X-Gm-Message-State: AOAM532fD7RM1dr/9SB2Yp5JYrDBERAdK7ytfzDh3McQYpEyKqN2q2iI
        3ubTLezR11vDd4a5Uot14ujG8wY+Wa25bezf85imfeUyTTc=
X-Google-Smtp-Source: ABdhPJynrS9jwASYbJrK+Lrx+BIC0Hbxspdbg7GlsM6Dexdfc0+xhCN8Tzvf2+Y4423ety8oz20r4rApAdaOh3gv11Q=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr2172227ljc.286.1595510332105;
 Thu, 23 Jul 2020 06:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200719210926.152305-1-colton.w.lewis@protonmail.com>
 <CACRpkdbGzKbnj3ocEO5wTO1edB9ov_1BRh=hh6wC8EYyZd1arw@mail.gmail.com> <20200723095658.234668-1-colton.w.lewis@protonmail.com>
In-Reply-To: <20200723095658.234668-1-colton.w.lewis@protonmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jul 2020 15:18:40 +0200
Message-ID: <CACRpkdY-nXtzWt7yVusZdM_e3Ug34q2-LapeOZhg6z7ObbEf4w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Correct kernel-doc inconsistency
To:     Colton Lewis <colton.w.lewis@protonmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 23, 2020 at 11:58 AM Colton Lewis
<colton.w.lewis@protonmail.com> wrote:

> Fix kernel-doc comment to match parameter name change "chip" to "gc"
> in gpiochip_add_data function.
>
> Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>

Patch applied!

Yours,
Linus Walleij
