Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569EF440A34
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 11:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436279; cv=none; b=eHuXK9l7ZVtUJnVN9dmKVpYZeTHlbI5c6BtCdvqm1I+mmiABDPe1BnoGjrZz5D39KxO8pR2kWvnSkqB7hVzi7mOme9nV8du+K4eUh07qayNRNVzscriXq9Z8vHwhsokJMneqhQUpm/relUdsppCv1C7HQGoYPVfsrRddepyzPkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436279; c=relaxed/simple;
	bh=C+QWB+KZzeonLvV0qDuesLnMy5eu8R+OizXBY3d888s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTW1HIC1fIO+XIwKjjWG9BaOh9qMQlKI9v33COP3Jv+FXOWpsPKyVZdmMitX/w+rYK6Sbd3Kq9TumRdthnEhqPy9KB2zefw0nmYq8Mn6tOpoP00WYJdguHvIULf3S82hdVk4KHyB17JD9+UlpGpOGWrQ0JIfLpQKf0P6plEaxy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuMsJK6I; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuMsJK6I"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4843e397f74so1317079f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 04:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788436272; x=1789041072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LiMV9lpRiXnBE6CK4fygOV5eeeeR5AdD/GCs6lVbQQ=;
        b=QuMsJK6IPyQoldLxUmoNS8vlhkN23066FUD8gMtVLSfPwrcA0V8B+oGC+OsBPzuOHr
         YIPb4F0p4CrJSOvCV0YUbQ086PADTWdAsxcinxy4Pm10a6gzblDtcOeMqTe3L5WrYzq2
         LkKA9YNCMkx7Y/W+6pj1HEx5JBSBB6GXoFdOeoccfNTtyxmSsRAXKxVBIcHRkJa6LHdk
         3J8xI6RTRiGT0rTNrLg3l6TpB6GFKWStuO8RCY/CNSvSXcpfmJw2PVfCwX0dxrOGuxoq
         MPUrkweb4VYWWqu+89gf9nHf0oucmQmNnwVC34o9XTdW+iU7kqW+PIn6ob3tfV3mpFDs
         qFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436272; x=1789041072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1LiMV9lpRiXnBE6CK4fygOV5eeeeR5AdD/GCs6lVbQQ=;
        b=kco4EY27tQy7V/wLgraw6sB2LlslmFbmBgQ/IyTsI5UE9CtE39F+WNswzmbL19EOK1
         YBuypl2TYWv3VqHrL9CmfDLmokDPpm+cdGeKp+036JsCUmj9v88WtLBBghpxGHfakIOD
         gUK2kS9Ji9oOgAfoegkXPUX2hBBu54odYOoPrXqhgwzI2eBdo+Qjthh3g+JqfpMqistW
         VL0oVJiuqwV98/fDQn1qbIvBdPeqX3YFdh72J36/xodkIKStRsOzvDzJ9lyFc/SDI4FU
         4+MFB/zDqSnDjN5cUwmP5VEjiXf2FCM0QtixPOCXS9xPMjirQeUCJsjBfydZZnXunBlt
         HYzw==
X-Forwarded-Encrypted: i=1; AKwUvBxPkBUNXi/WawaaUFbvWOmNIyXLBeNq+f1QkfGOT0J9rjAEeZbNE6VTkYqu2LHsF/sLIMobBo/Nll1V@vger.kernel.org
X-Gm-Message-State: AFuF++kRsYeQFkXL0D4FWl0dN4HvTyzHu1q60PiM4iCULvcc027DqapM
	ZIMFtEsVviph/F1jsEeUQZUq+CR/hxMUmhqCvpCAVhTr50tDCIieA3/N
X-Gm-Gg: AYBFou1zlhoosKeT9I+26kg6NrTPXxLhsVxlA/ldbZo3MdZUvCFBn0szQPtCxdAbpoD
	O78m73Jr7s3V48U4BlV3eB0xJcfYWESSqzDeVAmXt2OUrW/L+qqq/D0uxARruh/SFRyCbOvmPrS
	saedNKQjRZLV8J+Jr5ZGcZnXVb0gXTNkbod8VwOKwy9MTzUP3kFhdgZCL0PJ3awPQruc7fC32oW
	EngdVthBX0/HZSyEmbZ+R0miPLueHD+/MHg54/TW8PqP72dEcqGO9ELiPiE46EcP6A6wpkdhwBs
	dJ3TNjks8bCHhURCT/byjy0Y9yRNLr/DvzXK44NOR1WMIDtLwVwCcg9pqfdpnBeOuQkvVfiY3ra
	THETlKkUSemXGkHeWcgirb68MXsUgh16BCdB3pU4nhXCxwabIxRrEjBDhb211ojSnZDZt4tvUbq
	hbKCQES2DDlS7vbagjgu+BZN4+3+aaT6tRwzpLeRcEMVeJQza19fIiNU9F6cTImNT7j/Vo1syzR
	d2wddur9H81d7DGNCUgET4kNhzRp2V+5hDHEjOQTzSTIm6oo1GOws5PEWW1Xe9fP8FpzItrMQ==
X-Received: by 2002:a05:6000:542:b0:484:361a:1c7b with SMTP id ffacd0b85a97d-4857e4eb54dmr6750369f8f.7.1788436272260;
        Thu, 03 Sep 2026 04:51:12 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm13185506f8f.2.2026.09.03.04.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:51:11 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:51:10 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] of: property: fw_devlink: Follow GPIO nexus maps
Message-ID: <hxtrtbmfb3jznfw7ooiyx533fzuuagxlhweq6yo4n6j5bne2uh@omibim7aiobk>
References: <20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com>
 <20260902-fw-devlink-nexus-ready-v1-1-68fe1996e78a@toradex.com>
 <CAMRc=MfN73=K1nZrqUbhrMSijjpzhF_z_U9JU4_H163W0vRpqA@mail.gmail.com>
 <qg2nemg4mlxpancg7az2vsnjkfc4anxkieozoxh3mj3zgkyifd@b5b6yiz4uew3>
 <20260902185513.4867bc92@bootlin.com>
 <874ig664ih.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874ig664ih.fsf@bootlin.com>

On Thu, Sep 03, 2026 at 11:57:58AM +0200, Miquel Raynal wrote:
> Hello Ernest,
> 
> On 02/09/2026 at 18:55:13 +02, Herve Codina <herve.codina@bootlin.com> wrote:
> 
> > Hi Ernest, Bartosz,
> >
> > On Wed, 2 Sep 2026 15:22:36 +0200
> > Ernest Van Hoecke <ernestvanhoecke@gmail.com> wrote:
> >
> >> On Wed, Sep 02, 2026 at 05:30:19AM -0700, Bartosz Golaszewski wrote:
> >> > On Wed, 2 Sep 2026 13:41:39 +0200, Ernest Van Hoecke
> >> > <ernestvanhoecke@gmail.com> said:  
> >> > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >> > >
> >> > > GPIO consumers use of_parse_phandle_with_args_map() to resolve specifiers
> >> > > through gpio-map properties. fw_devlink instead parses GPIO properties as  
> >> > 
> >> > Unlike PWM, there's no such thing as "gpio-map" properties.
> 
> Just as an FYI, there is a pending series to extend the nexus
> node concept to clocks, this may also require some fw-devlink magic :-)
> 
> Link: https://lore.kernel.org/linux-clk/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/T/#m16ddef087544db31b5f434fa44be70aad0b5e37e
> 
> Thanks,
> Miquèl

Hi Miquèl,

That's the reason I put you in cc and also the reason I went for new
NEXUS macros in this series. Clock would hopefully be the next consumer
of that :)

I should've mentioned that more explicitly in my cover letter. Your work
on the clock nexus can certainly come in handy for us, thanks for your
input.

Kind regards,
Ernest
