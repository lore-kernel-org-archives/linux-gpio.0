Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266168;
	b=RvzDoijwWY8BcZwS4dE0U6D6n9q6oQ33vLlXqa60D6QSzABkm2b7CtX5uFQnKcDtItm+
	 WcEXwT3hPaRw/SHPqUDQcZPaAYijEfXmQzY+cATt6+dHUpd77mep2Cd5lcWAuNobz5nxU
	 eb04IJV8URfdKg9Ig5Lw1kZakhq1t8ZMFDAz8AioqYfHqlYK+KLTblMFYuZv6X6fd4M99
	 hBGsGK135XtZ83K0MxlkCe82cFilNFDH8dL/DosdZE7sCYeDI1L4CLnDa9VSe3XOhJbqS
	 EYaz2uWhJ8H4NzVzYpD8SRdysS8Dsl5oHPsuIA+LE5+hGuv1XiEV0nZ433y54Et3PJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266168;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=BG0tZQ11JJC9xUSQsLPfPeO4P84oYAHHSlBdRKJggas=;
	b=AUIyozJZmn9RlJj8ci2wiZdEt94aEK1FX+AGwGVv3iYjj5wvDMVlmOz2BCBelU9tG/tn
	 qDouJpLf76562qMbK6cZjeSTJj7TnzO2k7T4cUX3MQfebX2U90HRGzYvEjZqQaV1CvhdO
	 U105C4H3C1jqxP1Z42SMcColKoNDIe9AypeVSBujBbHo+b2dHwPn7v7ThJDx3XqiJyK5S
	 m1fo1RDsN1XkYiyGFA5/xx7eesH+7flMTuoRpfrUAXwF+GG0UU/JnDf4YwwC+uZmxr1Q8
	 ZbzaxWT2WLm5Q2OZDZy7MLh5+fGcWape2KHZ14aD7CHj85T7GDRERNER8Y+cpRXtTYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=znzjoBLi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UF8CDRKG;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F7606A320;
	Thu, 29 Oct 2026 09:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 337F7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=znzjoBLi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UF8CDRKG
Date: Thu, 29 Oct 2026 10:29:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793266166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BG0tZQ11JJC9xUSQsLPfPeO4P84oYAHHSlBdRKJggas=;
	b=znzjoBLieQYSIrmv+QMgLEkGf/NJO1W2YunETKvhaR/xQUhOF3v5SPBRToMUcdviMLn0B3
	YiwlENOWqmPUTCfaLBM/s/Cdsi98pQsMekndt+b+WdoJi5ChyHwI9sZYhZwvHDVwhqErZD
	0V9lVmcLTl51aGbx10LBIP2PsSKNbmFvrrvSEP2tgv4tF5jW+Z0Ebs9dbW/p/0PcPFwUB1
	a3relYguhAl7C+FTtZNVByZpUn+ZoH358cLbCX0C/wcPbzjcTwRKIDh5psQJMmNnK2HmHz
	ldk5uuKTkCkbmlBH8sY3JVudueMUUMY9ZolVg8LVOAcClGxfQ4hbjJP+zjYrFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793266166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BG0tZQ11JJC9xUSQsLPfPeO4P84oYAHHSlBdRKJggas=;
	b=UF8CDRKGrO2s+945prji3AsZf+wIU7Yv/XUcP3Pq87LkdOqvjwxotSzQ5GoFpBz82SECID
	ekrihXS8jjCfhyBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
Message-ID: <20261029102611-40fa9198-1caf-4c57-a03b-d8066642d330@linutronix.de>
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
 <CAMuHMdWhBeqmMt-VXbh2u6AvzyQ6NsZAzATNRZCnm2DHUAFUFw@mail.gmail.com>
 <CAMRc=MdWuoANzpNDa9XvJjK=ccY12y7TJaqnUsV8GRqSDh7jAA@mail.gmail.com>
 <CAMRc=MctUi9g5DUOxEa3F541gZXfeDO_dCoJO9D0tmHmcfa_9w@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MctUi9g5DUOxEa3F541gZXfeDO_dCoJO9D0tmHmcfa_9w@mail.gmail.com>

On Thu, Oct 29, 2026 at 04:43:44AM -0400, Bartosz Golaszewski wrote:
> On Thu, 29 Oct 2026 09:41:02 +0100, Bartosz Golaszewski <brgl@kernel.org> said:
> > On Thu, 29 Oct 2026 08:57:15 +0100, Geert Uytterhoeven <geert@linux-m68k.org> said:
> >> Thanks for your patch!
> >>
> >> On Wed, 21 Oct 2026 at 14:31, Bartosz Golaszewski
> >> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >>> In preparation for the constification of configfs attributes, make the
> >>> existing instances of struct configfs_attribute in gpio-aggregator const
> >>> and use the new st_attrs_const field of struct config_item_type.
> >>
> >> This has a hard dependency on commit f7528cd38b87fb59 ("configfs:
> >> Allow the registration of const struct configfs_attribute"), which is
> >> not yet in gpio/for-next, thus  breaking your build.
> >>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>
> >> Since you have to rebase anyway ;-)
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >
> > Ah, dang it. :( I stupidly assumed it must be in mainline when Thomas
> > recommended it. :(
> >
> > Thomas: Unless there's an immutable branch I could pull, I'll need to back all
> > of them out of my branch and have them wait for the next cycle I suppose?
> >
> > Bart
> >
> 
> Ah, seems like commit
> 
> commit d4d9eb226e4c2af8ab390bb470477fa68072fa2a
> Merge: 32543b09681a1 6c1fa55e287a6
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Tue Oct 20 16:25:43 2026 -1000
> 
>     Merge tag 'configfs-7.4-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux
> 
>     Pull configfs updates from Breno Leitao:
> 
>      - Attribute structures can now be const (Thomas Weißschuh)
> 
> pulled it into Linus' branch so it's just a matter of post-poning them until
> v7.4-rc1.

This is what I meant with "the necessary infrastructure will be part of the
next merge window" when suggesting this change. I could have made that clearer.

Early adopter issues :-)


Thomas
