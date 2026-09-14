Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1156246C837
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391466; cv=none; b=NrCJgGPQmB9YfnLmBaP8/usFZV6u1OGdmRfKLxhm79/XHsz0UjEJXTFXC6u/zQpR67atntAdlHuJr6TCZrVnkNbpmkefGmUpGFJRvDAPMbm14bMwZmb7gmyDhijhPk5nMCpdaPaOVNXuKkiw2ag5C3MxfXNto5Jr5wVCXiSl4+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391466; c=relaxed/simple;
	bh=iwfdzr2iy+sC6+czneLHwr8xAhX/X+iDimNm1BSeY5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsKVnHw4jFWRMzAelHxeJaLindHKcXp4FeTLmrNohIiT9F3rVsp1oZG0Kf3CHNBTYxUvelr2DwPYBYgmniu+1YwmkBKVrjkLP9U5x1juKWLYU0lKuAtuWeEVCilwBDwnfd6Qi7KktGYDBz8s+ZzuzhrDV+LQVcHxDCMhEpuMd+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVHq8lnG; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVHq8lnG"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2949ed8cc3so530897666b.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391462; x=1789996262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHHo4dn4rFwPjLFZeXv9ABL/gp9nPfJCU+f+sXBzG+Y=;
        b=nVHq8lnGBWVdBIdc67fVSPaF9/cTT9t83+WwvFjCZ3e2vWzufeOFAFVzjl8BQfIOsU
         CRfMhurFa0ylgZJz5eLBuOgzgWQEaC9rY2FNq0ZrStS2+N7U+g19uKbja1+6Fqn+Sa4i
         hnCbFeHPG0r2dqbgPEtMrcH5v6gA9qaV/7MXUON3EyLpUgxePSovlba9oZP3+KjDZT1Y
         McY+xoXtLVziazvga6QWylC8adQuQIdaz373IZLIsofvg2/JVKaxkfCz7uY0ypXTFvxw
         dimuIr3vDJ2XfZjxov0ssqBLtwdHAzuzetldEkVd1dIbo6lxpAQIHRnpLQ4skyJ19Ptr
         zo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391462; x=1789996262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHHo4dn4rFwPjLFZeXv9ABL/gp9nPfJCU+f+sXBzG+Y=;
        b=rQph4TLjVtO5RxpEwp6SXvlNfdfnTC67GcWvunRW5+8BZSd5bWVxqfyxfUQiXbKdXl
         g0+Zapo90Lf6I1aYVgOIsj/lAOd01o80XDWCdIkwkRXR89DmVj7W3IKKRHDP4yyvi8oY
         y5OLupaB210pV7ouEEXshtAfqIPfznfYY/4h5Zj2CjHvnBpjWiIUUjHJJftGL9W5u0L1
         DjhACTflXLrQD6Wh3ml1LNYHKKAP78tgKavwiX5DKHLjIN0nmejtCNVW0M7CJxaF7HZP
         XRx5wcVc7e+iFycxZ0gT7OqRyY/0XJXhcHLS9+9OgqrvxVV7IttDoUdZSYXO/p6fVKgB
         /o5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9LGxZ+FQEh37e7+16XMapetfrkRrHv1osDsLvM91aOSoz1uNqyXalsOojPy8CxnmUGtPHX4LyznBW@vger.kernel.org
X-Gm-Message-State: AFuF++mnnSpx8DCQcL/+xGyRP7xs3UzZh8BX8/lpF73Tk2BbKVQmpSDN
	NdmSZUWv1pJE+LlIWhUgz3JW7HsEYR0EupDqbNTQtNlIfBM0+bdl/0DE
X-Gm-Gg: AYBFou2wQJVKj5+rnF6/SJO5T558WRudgqpta5VhDg6S8xjsGin8DQSpS7tB+mVYWdD
	siZ1bq+rYfpF1uDN9fVTIClYf+KQAoNxngWSvgj6V+DkKlG1M025FZvIcqpgUqBnjfXNVmiYLjG
	690bZdtmZluLtdLubMAkKLIzYCXn30swvZ+rKr4kYFVP9UJT67RNsXPzZEVCc4eyucLiQ7CNK+r
	bmuprNrZKsJHB/3afuaOhgZeK6FMTYp8X/yMvdI5faAp5fyydQglfiB+OEU94D3Si8/uDiyC7Im
	hhj2LmLSLzZetkJ2zhlQeqOhBcoOYn+9sPUFeHJ4ic8tMDJjFYdDku6xA+zyhn3Q3plhZhj9IQs
	FSrAbOeNJPA0WxkPpoFJ5fcemhWID4uKKM9JJR6Lne1ctM+wyZ9vVlAARIqWKC/bdvU+zEiEqGf
	XGHjmFdqFOXhX82AWjwo3pD7G/adV9tVMHNg/mJuDQxZpfvCgVrTSeZxeTotiCbnW8qEHndV9je
	g357w==
X-Received: by 2002:a17:907:f497:b0:c26:19de:912c with SMTP id a640c23a62f3a-c29b86f1102mr156986966b.31.1789391461783;
        Mon, 14 Sep 2026 06:11:01 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021ae8sm429403566b.22.2026.09.14.06.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:11:00 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:10:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ceclan Dumitru <mitrutzceclan@gmail.com>, dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aqfyYSagcejWb4xD@stanley.mountain>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain>
 <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
 <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>

On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dumitru, Dan, Ricardo,
> >
> > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > Can you check this
> > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > patch into that, otherwise v17 it is.
> > > >
> > >
> > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > that branch yields no warnings.
> >
> > Dan: any plans to merge these things to master some time soon? Or:
> >
> > Ricardo: could we use devel branch of smatch for some time?
> 
> Do you know what patch fixes it? If it is easy to cherry pick I can
> add it to our list of smatch patches
> https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> 

Commit d12183645a31 ("precedence: silence some false positives")

Sorry, I felt like I was close to merging devel but then I started
another major surgery to the core and got stuck.

regards,
dan carpenter


