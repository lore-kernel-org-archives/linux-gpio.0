Return-Path: <SRS0=ahNV=24=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256F0C33C9E
	for <linux-gpio@archiver.kernel.org>; Tue,  7 Jan 2020 09:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F05BE2187F
	for <linux-gpio@archiver.kernel.org>; Tue,  7 Jan 2020 09:39:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rA1Ka7KA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbgAGJjr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 7 Jan 2020 04:39:47 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39767 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbgAGJjr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 04:39:47 -0500
Received: by mail-lj1-f194.google.com with SMTP id l2so53986549lja.6
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 01:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i3cS/9vMqkCo81SU7Th62UWfgu4oOT1UjxMMEZTVDxA=;
        b=rA1Ka7KALGpQxmvVbPE60iglLaoeccZWqncEs7Bjwh+b61n6MsWy280UTIFBwLJEby
         xmwoXqiZflpYJ0e7Fe10bmEBtJckNsAzc53GPaTZrU93LxftedP8Fqu+J1gCF+pgpyBT
         I9Yhb6JkWbMsamoOwevMg2+pvk9H+va78YEYNy6ByEVnqtGA/OPU5+5Xe1CgGC7Kg6D1
         kaNsCYi42q9w8cd9mX+QTtVzgeIUiMR4hua4DrzagL6RSOGuEOMmZU+xvQHRhRbBHG3U
         /Py9pQygYD8j3siHFuy5/Rr80Ubukx9DIIW+CO6S7W9ftoGjyOV8dE/qUJ44skLXIf5r
         4bDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i3cS/9vMqkCo81SU7Th62UWfgu4oOT1UjxMMEZTVDxA=;
        b=s0j9EtYNK/NLaUfY+hGZvBbrjjb/K0/Regpn8WI9F2OQe1fuUNKxNXuiKywN79Kbhp
         rh86NZRdHBpD/bqGo03fjjq3NJf1LoPEtKbcbSpOxutLMUA/QGaXGX3FeeAUEnw34uDc
         0rKlPrhFEJZxfV/ozkuVRRj52MiAsHmc8WrItjtbMDDzPxuPnl7mu1h6R1ZI4yaR4nWs
         LNfgC0TXhB4vYdCmOSU1nmBoF0N1g4RaF08StSM2EALbqxoWc/uzKkEuPvbTU50vW5lE
         6Sn1qlNHjnrmlPsgX6vUxYjgayQhqs/f/K0Qvb+RlWNSbAJvDm/+NXoYu7iefCJrnyqR
         KiYQ==
X-Gm-Message-State: APjAAAVbPdlqhiFf+EB9zzwAGwnusznwSKKfQXpEDf/yQFzCkVbO5Xfm
        t+iKHC3vRiCMdBiHZUCM2ui6/fL9vcdfERwWP5sECw==
X-Google-Smtp-Source: APXvYqxY6HGvUSX2SGuDJvW9mvHmyqwooWDMMNv+qXRlUg9DlXeEWdh1EBMi8VP9eCgXqAhVRVXwW6n8fn5Y7fYIRQo=
X-Received: by 2002:a2e:a0cd:: with SMTP id f13mr25811363ljm.251.1578389985321;
 Tue, 07 Jan 2020 01:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20191218101602.2442868-1-ben.dooks@codethink.co.uk>
 <20191218162616.qsxsltfsrxotzqhb@axis.com> <048c9653-114b-f726-44b2-9eb1d460b5b5@codethink.co.uk>
In-Reply-To: <048c9653-114b-f726-44b2-9eb1d460b5b5@codethink.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:39:34 +0100
Message-ID: <CACRpkdYFzHCMLj5oU5JMCkQkMZyOvM5351tpO6iEsE8e5nBZWQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: artpec6: fix __iomem on reg in set
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Jesper Nilsson <jesper.nilsson@axis.com>,
        Jesper Nilsson <jespern@axis.com>,
        Lars Persson <larper@axis.com>,
        linux-arm-kernel <linux-arm-kernel@axis.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 6:32 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> On 18/12/2019 16:26, Jesper Nilsson wrote:
> > On Wed, Dec 18, 2019 at 11:16:02AM +0100, Ben Dooks (Codethink) wrote:

> >> -    unsigned int *reg;
> >> +    unsigned int __iomem *reg;
> >
> >       void __iomem *reg;
> >
> > We're using as an argument to readl()?
>
> yes, readl() shoud take an __iomem attributed pointer.

Shall I change it to void as well when applying?

Yours,
Linus Walleij
