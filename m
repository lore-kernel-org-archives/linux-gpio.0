Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539FA48595B;
	Thu, 10 Sep 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043695; cv=none; b=lCOgvDpd+hkAI/YKCN3Theh9J5iUst2Zwhu9+CclO25DNntmjqfH8M2IhmpKJxIa6zqpWxE1l1O6iyRzdxpSRhI7KpmV0+2owaeeEA7d3rUrcbnQDcBkaNTwJAH2oAv95JIxId0+Rs3dMLncUl1pc3ICzX7mvNZdur7NvZF3+TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043695; c=relaxed/simple;
	bh=R5IIQUSffnX9KzdkFYW8JXqA+LYaU2CIl+sIeHvBmzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7dIx3kzRhw6IQDD37VdU3HnDaGw2zpE3wbWsfdZBodhlNm7tImod5C/aulCHtH+Xsh/77Uv1n/HeYjEMgx5kRhgGiv+8+MwQA9I6Q4W4s23Xk7RgdE/0TTxJsgEgTJH/+DWBKF+ptwhWQKyRSGMi8tofi3jr89znUXWpiZN1NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u1xLW18Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u1xLW18Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578341F000FF;
	Thu, 10 Sep 2026 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789043693;
	bh=Io3H7eT8+LcVwxa4TUx68Yyzl1iwGXsQIYcZ6tFQJ98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=u1xLW18ZHX7/n1Wou5fWybTlwRYu6ZlLjZtXO8L23OFv40UOva766BrcpKgINEwrf
	 AhteRRgEUNZ1S2S4dJBbJX26x5fRnke9xFf26XrSZASXOHoei01unD1PQv+JG5dpM2
	 Mdw4hTSE2GPfyTpK9pcMOPeFuaHN8/0Cm9zpXfGk=
Date: Thu, 10 Sep 2026 14:34:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Message-ID: <2026091038-trailing-jaywalker-2055@gregkh>
References: <20260908-usb-fhci-drop-gpio-nonexclusive-v1-1-8e405dc67874@oss.qualcomm.com>
 <40845ad0-e321-4e1b-860d-ff798f430c42@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40845ad0-e321-4e1b-860d-ff798f430c42@kernel.org>

On Tue, Sep 08, 2026 at 01:58:18PM +0200, Christophe Leroy (CS GROUP) wrote:
> Hi,
> 
> Le 08/09/2026 à 11:27, Bartosz Golaszewski a écrit :
> > The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag for gpiod_get() is deprecated. For
> > actually shared GPIOs, it should be replaced by using the functionality
> > provided by gpio-shared-proxy. The Freescale QUICC Engine GPIO driver
> > uses it as a workaround to access the GPIO descriptor already requested
> > by the caller of qe_pin_request() in order to access the private GPIO
> > chip data.
> > 
> > As the existing comment itself states, the user already requested this
> > GPIO and the only user in tree is the FHCI USB driver which does in fact
> > request it, we can safely modify the function to take the *exclusive*
> > GPIO descriptor as argument and stop using the deprecated flag.
> 
> This change seems sensible. I will take it via soc/fsl tree unless you have
> other plans.
> 
> Greg, can you ack the change to drivers/usb/host/fhci-hcd.c ?

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
