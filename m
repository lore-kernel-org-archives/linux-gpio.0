Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A162266581
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387832; cv=none; b=BCJ9/mqLlwOeVujNb7Y19ofFj5qHxH27XVOf6ojDSlYnDMe0Wk/O8jhOiGl29BiGnc9otzkRZD8dI/+PlY5qFVotfilWJe+7HPfOdqzm/fQQfiTedO0YhmxBwHQHfCBKQV60mncSgwWw+r+Hs+PxmWo7rytsNsGiEQp2fxJnh20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387832; c=relaxed/simple;
	bh=Se7NkzKRBbstIWMyWUOVe+AMD6O75GbMwW/t+1YRS3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqrcM9PM78Jd8u9Vcx20WmlfYdR/Aq5bIu2NmCLPJjXonDWC2AzGd3aDDH/uvuD3pwvwGnb0TUcTbxyaXQa4sczoQKqk2Mkl30NIv66STsTOfVetxY3+wC2BaOh3coeUEt4mzrYf31bJ2IiJB9TcCImgJpHxvOL+hwwcy1oMnIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JlWuwWtx; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JlWuwWtx"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-478cbd5b48aso1663143fac.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789387829; x=1789992629; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=JlWuwWtxH51nEvHn7rF4rdoYC+mKObVerBorCAzI+wqx4svsciLn3rHQDBxyBU/Gcf
         HVDeXuDpwgUQ5ma77MiaPMO8pt7haDKW6ohqTldYLQGdza5uL/J0CK0SKAm/qgEUk1Eo
         FlaV/8RJioxINO1PT2vVYS2NV+h3X6OWkvNLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387829; x=1789992629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=iO5Xo4A/aTM87v7S9ePRuLe2q1IK01rv2q45m/LI6nLVDUZk7srbN0OAZyJs8cyaBj
         5ZW0RFyyZYmHKCgY0AhekeK2VFVhm7MBH1+00LPULuUfj2UTX3B0/mzOwR2/dPYN18UE
         t8z4rboYKNpOOBv6nU+oAOeo3wV4Qeh7INYN1VSeaxJMqwWyxrm+3rZbdf9tY4EpIm7W
         ABvuSFh11oGKIdgjJRPW4amfUwMktaMVDxinnPOiNfwyJ66mhfTCPsvM1rgem0YEVzvW
         Tmi/0txS0mfcX61016L61D6nclUptaEW7DOzGcA+SgI9qhxWiAgrKt75B9buQLdnFIhQ
         Ng+w==
X-Forwarded-Encrypted: i=1; AKwUvBy5oWf1/hSz6/M9O0Ro8XGJUXa6rQgkT6DlPjfMCie5nVLY8iPBLYaCo+1lpae0zkvjxhu+0fzmx8Pf@vger.kernel.org
X-Gm-Message-State: AFuF++kGyig37J5/8QFb/D9QTunR6FF4TGJzK75ANuCLaZB8I20q7LX3
	KHq+hW2AncB9eGRY8m/XgLyr48s2T50o6IV/j/M0GlX8ohENK0Ih8ug9CV7f1RdQdOLOo10u/1C
	icX5kkwm8
X-Gm-Gg: AYBFou2S6LwiLjth0z/mbtZByDN7+vFGsoA8ZCQwJtoU7BSmFYWBWQOJ8fYp2lRELNY
	fpyH+dGF2unk2AHl+sBxxqXUm4U+e4moNxj4OPh73G0meIOR3q5tXixT9iBfWlwalIVGoxfMsvK
	N3usaxiYNf5G5NhXAyXXTVJXo9CguLcQLat0HnpghDeDIirKBSMhkfSlZo2/LAxoiZqgHL96+Qr
	q+g3sOXmw4E1WuoWk0WV8u2+LIX1xxDZv/E3c2PseGcLc4fySSQUsb5YCvgSQ+c0BVadlkz8C03
	FvxVtq5drp0dskwLsiTHM3gqYFqyfkt5sBeOD+8Rqgmt/935sULDQv6H4DliV3/BSIIAs/vM69r
	MEANFgRfQVKnmk95/dQsLhH0zz78QjKcNObTGhgdp9O2LDZR3wirB2Tfue6vBwL7iHRQrxlDxEJ
	6q9WdjhyEIBQUb5an1K+uy+BgCK2MPljzp8phJq6dArLHCj0f861J246w5cpvB71n9SozOkmGOu
	Wd7RjxY+VOQ9zIyaXW9+8MXMDTiImS38dYm
X-Received: by 2002:a05:6870:1649:b0:479:7931:cd6a with SMTP id 586e51a60fabf-481fa2428c3mr1262422fac.32.1789387829146;
        Mon, 14 Sep 2026 05:10:29 -0700 (PDT)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com. [74.125.231.76])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90f5b1asm9238512fac.11.2026.09.14.05.10.27
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:10:28 -0700 (PDT)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab667so2769761fac.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 05:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByg235UuwLHvIKpLimiWLHhoJLCbrwXLwf2CWfmkrLwt9pHcNIduBMh+AcYfhVCrjRet208vUUSVD1u@vger.kernel.org
X-Received: by 2002:a05:6820:1f10:b0:6bd:cd33:b885 with SMTP id
 006d021491bc7-6c541b4585amr1031566eaf.42.1789387826624; Mon, 14 Sep 2026
 05:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
In-Reply-To: <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Sep 2026 14:10:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
X-Gm-Features: AcwNN1WrtThLwvG4t-JyEDTnuDjJJzAFO-QYuNebGgduCRp--_WjKNF02oVq8vc
Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ceclan Dumitru <mitrutzceclan@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dumitru, Dan, Ricardo,
>
> On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > Can you check this
> > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > please? If there's a single patch that needs to be modified, I can squash a
> > > patch into that, otherwise v17 it is.
> > >
> >
> > These are the same warns reported by Niklas in V13. Dan fixed them in
> > smatch in devel branch but fix is not in master. Testing with smatch on
> > that branch yields no warnings.
>
> Dan: any plans to merge these things to master some time soon? Or:
>
> Ricardo: could we use devel branch of smatch for some time?

Do you know what patch fixes it? If it is easy to cherry pick I can
add it to our list of smatch patches
https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads

>
> This driver has been waiting to be merged for quite some time so it'd be
> nice to get it to 7.4
>
> >
> > https://lore.kernel.org/all/ai_txjwLPHsSKsJI@stanley.mountain
> > https://repo.or.cz/smatch.git/commit/d12183645a31b737d7fb39cbefa589e34615e8f7
> >
> > v17 is still needed to revert one breaking change introduced in v16 and
> > fix more findings from Sashiko.
>
> Ack.
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
