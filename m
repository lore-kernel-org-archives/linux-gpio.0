Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DCE37C934
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487821; cv=none; b=tSQ4vSyYYLH+sLlhf3cz3E2IHQsbYyUucXgQn6X1v6Oci9C3okmUM8LlI6/jeHfpMnv6i4DRa9PIYKSXFs9qJvStnKFYQefKgb2wh7qKdQJF4z+E3dviESrClwzppjez1lj8xMMAdYwF5sm0tzd+QWFaiAz4JNwS0HeOTrooLBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487821; c=relaxed/simple;
	bh=QlBta+H5mNjq+dbHXbi+7XyTVzhQ/G0m8qgfcGULLxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHk8FbYAH3vami9mLtTXVfzpg/ozveaZxo/XxACp+Bg583HghI6h56sg3jNzKnR6YqsQljuqWAFuoHgOLKlMAXPLcuiRmOLC0GmgTxm1NiFIduOiGLuPX+MkLeyDdg+xavnFtsTmnbZyCNG/hmjHmkIUKFLXwWdD29Js+vRaU5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=blkLUPTg; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="blkLUPTg"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86b90133ae8so2726800b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789487819; x=1790092619; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=blkLUPTg7I+0FZFzhMl8EnJS2IyhIUBx1RRiEUYP6YbqqBlRmr9Q4C2r8CFnn+M5Ju
         +tlTxUL5njbJu/InNIZFyaADzHcR29Gxo+rrWdKJwnxwhMz+Ai7zS+NklfQdksMWP3Fg
         QiQEawWObGso9UQIsWXn8cMpF7dJ26li/LAPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487819; x=1790092619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=TdE8axSnVeOXeeEiogO5E8vebKht430r0H6NNzlSq+o16Bkv5DCYU+Nd5+QC29d16q
         fnAEK0fbYX3dJ5jHm3r9EWGbBCG6rNfFVcRhtXFGKKyxEBRsBHgc1Swd+dgXOca80XaJ
         zIIKFqmwxNuQuzYi19btDAzJ0Np/XBho4zjP+croyoDG5NFCQfdKhP5BNuconqdFwzo/
         dPFPiF3XiAY9zhf78dc/0wdNqZ17NqZLjo5JOS8AbRrvEozTVN6VP5xc+RUhV4T7b801
         xhCLDSwX+LxV9LJjyvgWCMfLjLUmTM9+wYkAshomPI9HO3gF2i5DHJMyfhK+ietcx9uY
         we1g==
X-Forwarded-Encrypted: i=1; AKwUvBwML6ScI1GW4515zRx/KH6qBl/IweREtb+Su+Tbe9al9hCv62iJy47i5KNUpZ0ovIkMvygIS9+aWzVl@vger.kernel.org
X-Gm-Message-State: AFuF++ldeiUX/HpN00nH6mXo63XYBVv9TS2AFU4ZfYhHNfCTIiBbGjku
	QTwTXs67xWHm9xrcALzNuHF4KWXPUJjFCgU8ABY53dfAfbVCOIdoEpSkW77+zsfRkOMXNTn8wVJ
	dqPpLNQ==
X-Gm-Gg: AYBFou2Ah59/EYlnfI4LUFkX+mRHw3yyXGhz5ybu2wrsAFNmfUX04mgtHhiuQRWr3ZG
	qcgMAMZ7Yg4qUuEWAjwbz8UK5Z0qX4KUwJW8Ui/X+5iTbNTWowMTDIN0DJCT9xjlkQ8tGPM3SIX
	aoGRjgaWkGS8lM7iizE/WXmgdQ7B/3f3cs5ZW0/tZjwOMXp+f5Whz+z5SJl/2gb21gi2RrvXVpn
	oxrQaOESXAYNuxn/rwA7Wx//Q0777OVyfAy3MTMEO64P2V9vPgvjzD1iSOZK8ueaPVaQOjTKsXf
	GZXnvJZIYdLN0WXY7V6Dazm5kGdCeXZi8ln8NHxxqB/WC+CqPhmucGWCM57mr5jX+0VYZUYAyoh
	GqyGjhW4ANiuxIfPECSbnp/YoNnq9dpCzw5/JnL9aZoQ1Xk0RtwB7ZH23i4L0YB208cVob8OdMH
	eid1Q5F0TQLSdT4iKjvdEG1zYl0BX6n0qDM6XulciYE/eZK+fgCbswd1305+Acr7MoYEEv2gvcm
	UsYteQ352G7bWYe3XIpRQ/KK7d8dzcRwEjk
X-Received: by 2002:a05:6a00:e0c:b0:868:e6d3:fc18 with SMTP id d2e1a72fcca58-86f858edb56mr18539549b3a.15.1789487818673;
        Tue, 15 Sep 2026 08:56:58 -0700 (PDT)
Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com. [74.125.228.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250bf43csm6495790b3a.3.2026.09.15.08.56.57
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:56:57 -0700 (PDT)
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so2547178a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 08:56:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLLU+AmjWTIU9+6laNw/bI/x1ok+doz0z/+5eZpds+eLUePc4FLz521WFyIj2VRcNiNeuvdLN0i6Ob@vger.kernel.org
X-Received: by 2002:a05:6a21:3315:b0:3cc:3d08:da2b with SMTP id
 adf61e73a8af0-3db405ca519mr21103752637.15.1789487816474; Tue, 15 Sep 2026
 08:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain>
In-Reply-To: <aqfyYSagcejWb4xD@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 15 Sep 2026 17:56:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
X-Gm-Features: AcwNN1VOeS6uL0_wTY-nR6d_j0OJAaYWMrSrW2geaFCqxnwzMq5M1mnIaCQWjMI
Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Dan Carpenter <error27@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
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

Hi Dan, Hi Sakari

On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
>
> On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dumitru, Dan, Ricardo,
> > >
> > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > Can you check this
> > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > patch into that, otherwise v17 it is.
> > > > >
> > > >
> > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > that branch yields no warnings.
> > >
> > > Dan: any plans to merge these things to master some time soon? Or:
> > >
> > > Ricardo: could we use devel branch of smatch for some time?
> >
> > Do you know what patch fixes it? If it is easy to cherry pick I can
> > add it to our list of smatch patches
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> >
>
> Commit d12183645a31 ("precedence: silence some false positives")
>
> Sorry, I felt like I was close to merging devel but then I started
> another major surgery to the core and got stuck.

Thanks for the pointer. I have added the patch to media-ci
https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351

Now that I have your attention ... :P

May I ask you to look int
https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
in case you have missed it?

Thanks a lot!


>
> regards,
> dan carpenter
>
>


-- 
Ricardo Ribalda
