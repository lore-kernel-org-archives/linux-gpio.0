Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A717247D927
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077102; cv=none; b=D5cr/F6EgGr3g8vyGbRO6zKy7Ei2NZZ/zOxJ7r0GvTop61jfLVgGoHy4+G5SfVNgbnbEU/dt+8xkdREBzPOs/MMekWSjcj9FRRmQJZgdZhu3Lkkq+Kt1NxLoa1N88LvBfvfHTz3G7iHoE/1lXINxtQ/k5qQg8QPJzqZimQYyW9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077102; c=relaxed/simple;
	bh=vAqHJkJK8NybKzUEyFkNm7wHMeyR870vyueLoGzt3yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CXSVNd0SUrBWyhsb2wqcWdgdXG+tQMHVnamfal+Jjqv/9ue95QodUiTlPDa9rmU0IT7QRkvgamPPOXJWPYr4X+5GbvUSe7KlKtc32hM4EOPixsUvgkUX4EjnW4dUzm2D6Valw+cw9mo3SVzGQKL/sDOzM7Hy27AeM1zuQIDGKQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XNBPwa6/; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XNBPwa6/"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a0299c787so302481485a.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 04:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790077099; x=1790681899; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=XNBPwa6/MWDP6iz4maadlXUKQZ4LE3AugZXYyycFPd4RYqN7RjhDUcwm8xrmi5vVlZ
         WPlg8efYpwKBFGGoP2wGGkSir222XTnInm4QjIHamDq2yXOu/C3R8Qq1YZxO1XHiKsn7
         X09nAm3s8G32ZRuJbI/z1/OVOMfZmFe4x8a4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077099; x=1790681899;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=pCBzXfM8ENsLKNsGFL2XHxJSX1GShg+vUApwXQbFx7YaCyQBok3Ybro1kKFRpBiJiy
         E5wdMgxGbxEPxz2CITTtmqgIGUsEXYMXGslupuXwNlXgxWtbfNjBYIhmQsMqIwYFhD0o
         8pMmD6Uq9Xrd4cJeEcayxvfp0QdDP+oGkQPsNmav3rNza9rd0hFbqxP+vhJh3RHUb+Yn
         EN2lo9eOmvJRnRvk7b7jmT9VeCISpjMpEMklej8IdKkTeQF2DcIaWaER4eevoaK2l6Ae
         tW06LJbX3HTlEV6Mq5KXYK1aA+eCJl4RDv+qX218p2aFBLmN5Ddfsqp2yvjzlNK48ikE
         5IEw==
X-Forwarded-Encrypted: i=1; AKwUvByo2E0G70jw+PiUeXqRnmZV6wc06B8GC+APaYe32KZmr8obEKxAX5G39uiFI3CyUDNRONI0bGnw7fX4@vger.kernel.org
X-Gm-Message-State: AFuF++nTOyTQRyqMDdL30V8QCcW7c2r7E5gIePlzAic4ale/Zp+W6Ep9
	bKJwwJ2CnvQUbawNVFih9Z3/pUamPcynf7UjpH/l0YKbQ47sUQMEmdygbQffqGqpqWQ62aUZIeC
	MbdRiQQ==
X-Gm-Gg: AYBFou0OQsBfH6egH75wDRDFU7FhlQvbf5o4UCjfUzwORjlqxJbSYQkFgmfc1wUEWe8
	CQXSCvlzMesNSxjTUcRoc7KEpxpcPWyQNw89zms+NJYR2Xay5C4OaFnPGSpMEQTQeRSf0LGSuUr
	/OcF1LXtZGNk3Rmzry3788uS4cw8IC35fTkdaBuvCn1+1YrD0V0DwgX3CzykYtKhdCO9v5uvklI
	8Sp0EXptnIcCcGT+pfcXM3DEWQYE576ISKmxq59ykwpqR3xSCj2UVy1nniiCsp3A//NOv4GkcKX
	ILpN6iPtRsmo71V0uC4ha7MTVC8RlI2N5mezHyS8fmiG26tPTJaUPlXku2t94FYUX4Nf71to+VM
	4oQOC40uaHI8iP8FiwKEl6tnLVQz5H4NjnWexn0howybgilrhnVD0u9B8jocudr9z6MZEVJTUgD
	A5+CKupuDaP7FJ2C++lOtNyLarCtT/bwSk/uJPBz44SWXzI8AtrhLaOTcg87c1kt81tue/ut7M3
	gQcyrz10nSIun2Sy7e4MexrVGZ3mRky+oveWGdskVPnbUEt
X-Received: by 2002:a05:620a:3712:b0:93b:e578:583d with SMTP id af79cd13be357-93c15d8773bmr558077285a.21.1790077099150;
        Tue, 22 Sep 2026 04:38:19 -0700 (PDT)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com. [74.125.230.205])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d03b89bsm121214285a.9.2026.09.22.04.38.18
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:38:18 -0700 (PDT)
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910c9ff1fso442591485a.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 04:38:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBziZ1F9OLaXZS1nTzOJW5/PWK36bar7osGMactWbSaxxpPGNSswFvRkuDuRoWwL42LTfwDMNYUtasNc@vger.kernel.org
X-Received: by 2002:a17:90a:e183:b0:39e:6c6a:209b with SMTP id
 98e67ed59e1d1-3a0732aab47mr857626a91.60.1790076789532; Tue, 22 Sep 2026
 04:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain> <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
 <arJjxjiWVlnHhioR@kekkonen.localdomain>
In-Reply-To: <arJjxjiWVlnHhioR@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Sep 2026 13:32:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
X-Gm-Features: AcwNN1XSEqnhRqXFFRQlQKzrgp_us5KopVV821iFq_cxHFRxG_Sd7N3TpS2PoSA
Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <error27@gmail.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
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

On Tue, 22 Sept 2026 at 13:17, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo, Dan,
>
> On Tue, Sep 15, 2026 at 05:56:43PM +0200, Ricardo Ribalda wrote:
> > Hi Dan, Hi Sakari
> >
> > On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > > > Hi Sakari
> > > >
> > > > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Dumitru, Dan, Ricardo,
> > > > >
> > > > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > > > Can you check this
> > > > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > > > patch into that, otherwise v17 it is.
> > > > > > >
> > > > > >
> > > > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > > > that branch yields no warnings.
> > > > >
> > > > > Dan: any plans to merge these things to master some time soon? Or:
> > > > >
> > > > > Ricardo: could we use devel branch of smatch for some time?
> > > >
> > > > Do you know what patch fixes it? If it is easy to cherry pick I can
> > > > add it to our list of smatch patches
> > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> > > >
> > >
> > > Commit d12183645a31 ("precedence: silence some false positives")
> > >
> > > Sorry, I felt like I was close to merging devel but then I started
> > > another major surgery to the core and got stuck.
> >
> > Thanks for the pointer. I have added the patch to media-ci
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351
> >
> > Now that I have your attention ... :P
> >
> > May I ask you to look int
> > https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
> > in case you have missed it?
>
> I understand the required commit is there and I tried to push the Maxim
> serdes driver again but I'm still getting
> <URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/110822240/artifacts/file/junit/test-smatch.log.txt>.
>
> I wonder if we could have the devel branch there or some more commits...?

I managed to reproduce it also in my computer, so I do not think that
it is an issue in media-ci.

I would prefer using only tagged versions in media-ci.

Dan, how far are you from making a release?

>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
