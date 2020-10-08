Return-Path: <SRS0=9k7y=DP=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CEAC433DF
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 21:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9BD722243
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 21:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602193510;
	bh=RJhcp0P+BXeJqRJ4aZJB8+g7YQjpnpH8cPYey+OYl/0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=yfp7F4oyjccXm6nld6xhrHfxrEXsFW7D5IsHCfp57vL+Z9HW4gXT6FulviI9DnfOe
	 gc0vLj/KGCQ86gzJ0Z7lfoCch1osAzJPpulk4oK88wMgyK80qVgZRTyDWlBP+9ZDIR
	 9b94pXBbBiYP70yIe8iePRrI5Q04NJnMRPMhDz98=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgJHVpH (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Oct 2020 17:45:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgJHVpH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Oct 2020 17:45:07 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 925F422241;
        Thu,  8 Oct 2020 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602193506;
        bh=RJhcp0P+BXeJqRJ4aZJB8+g7YQjpnpH8cPYey+OYl/0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=eY88cyY9oruEEJWjgpRtu1Diu5iIpoAHdowbKH9SkhvnG0EPmJoToewR1ioFsjuVk
         tR2x4/0YMIcEp9yRvVIq3jEqQIt2l2tR6nBW7IbaIE3d+I9iuXSCNov6AwwpFMlk6R
         1etsqt8xchrzkxcFHAIh2VV29EoQxwC0gdlj2YDY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602124753.29177.7.camel@mtkswgap22>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com> <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com> <1599546314.24690.3.camel@mtkswgap22> <1601719607.774.1.camel@mtkswgap22> <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com> <1602124753.29177.7.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Loda Chou <loda.chou@mediatek.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        linux-arm-kernel@lists.infradead.org
To:     Hanks Chen <hanks.chen@mediatek.com>
Date:   Thu, 08 Oct 2020 14:45:05 -0700
Message-ID: <160219350512.310579.18205549684029464732@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Hanks Chen (2020-10-07 19:39:13)
> On Wed, 2020-10-07 at 19:00 -0700, Stephen Boyd wrote:
> > Quoting Hanks Chen (2020-10-03 03:06:47)
> > > Hi Michael & Stephen,
> > >=20
> > > Please kindly let me know your comments about this patch.
> > > Thanks
> > >=20
> >=20
> > What's the base for this patch? I tried applying to v5.9-rc1 and it
> > didn't work.
>=20
> Sorry, what does that mean?
>=20
> Do you have encountered a merged conflict or run time failed?
>=20
> I based on kernel-5.8-rc1 to add it and it can boot to kernel shell.
>=20

Ah I see what it is. The email isn't actually plain text, it is base64
encoded and so git am gets confused by the CRLF line endings that are
encoded in there. Any chance you can send patches in actual plain text
format in the future?
