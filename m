Return-Path: <SRS0=ToIH=UR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57E0C31E5B
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Jun 2019 17:17:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0E2120B1F
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Jun 2019 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560878251;
	bh=gxz2lsIBCHtqlrnai2PXL2UVxeOWfaZQU6bFik8Sjj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=NDaFzEHU/ykDsAwprZWMO39OHmSLAA5RF+41he0U6CnG4e0ZmCjyS1gax3/gU/5h6
	 0mEPVcpmePBI9v07BbuidzbsN0hv3A7ZvljA3aUWS369pcY9jWAxn8TxjvFSQE8j1X
	 zvUGmYVI3rpbvltCam1hW6JnhSk2tAUMM8jllmzw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbfFRRRb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 18 Jun 2019 13:17:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:49580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729325AbfFRRRb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Jun 2019 13:17:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B37F92084A;
        Tue, 18 Jun 2019 17:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560878250;
        bh=gxz2lsIBCHtqlrnai2PXL2UVxeOWfaZQU6bFik8Sjj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CBfvxYNfBRkQj6K4ExHDKwqnVm+acxu60RvMLEjDJey3U8oM/E3szhQXmTN76AaXO
         6lrYYQIDAaAJ4NgrRHQOxGhaJO2V6RyuwXGFAZH/A9Gr4qIKZ8uEy6UKgcxxZpEs2I
         YoTbQpM2FgBFHc6rXHfms7VauinEtgRaTI84o/UM=
Date:   Tue, 18 Jun 2019 19:17:27 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     bamv2005@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] gpio: tegra: no need to cast away return value of
 debugfs_create_file()
Message-ID: <20190618171727.GA26838@kroah.com>
References: <20190618155047.16894-1-gregkh@linuxfoundation.org>
 <20190618155047.16894-2-gregkh@linuxfoundation.org>
 <06e0fa20-7bf9-7e5d-93a7-efba1379f74d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06e0fa20-7bf9-7e5d-93a7-efba1379f74d@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 18, 2019 at 05:26:28PM +0100, Jon Hunter wrote:
> 
> On 18/06/2019 16:50, Greg Kroah-Hartman wrote:
> > It is fine to ignore the return value (and encouraged), so need to cast
> 
> I assume you mean 'no need' here.

{sigh} yes :)

> > away the return value, you will not get a build warning at all.
> > 
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: linux-gpio@vger.kernel.org
> > Cc: linux-tegra@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/gpio/gpio-tegra.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> > index 6d9b6906b9d0..a54bba1bda6c 100644
> > --- a/drivers/gpio/gpio-tegra.c
> > +++ b/drivers/gpio/gpio-tegra.c
> > @@ -550,8 +550,8 @@ DEFINE_SHOW_ATTRIBUTE(tegra_dbg_gpio);
> >  
> >  static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
> >  {
> > -	(void) debugfs_create_file("tegra_gpio", 0444,
> > -				   NULL, tgi, &tegra_dbg_gpio_fops);
> > +	debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
> > +			    &tegra_dbg_gpio_fops);
> >  }
> >  
> >  #else
> 
> Looks like we can get rid of this entire function and just call
> debugfs_create_file directly to simplify the code even more. We can
> handle that.
> 
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Great!  Do you want to just take this through your tree and then add
that change on top of it?  Or do you need me to take it and make that
change?

thanks,

greg k-h
