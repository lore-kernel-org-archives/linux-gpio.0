Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9DF3F4859
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141408; cv=none; b=TpBvYPkB1zPVq4pwiTeIwGMcDuhoK9dekItEn609AE0L/C+A1JiZnD23NFDwhrdWFipTzP7mqpLtX0mwW/+l0VR1vZbNOmTPwPxJgs06dqfaSQXm+jIwe8VZaUH+MCSakwgwRqSCN4jfK4xf20i4Y4w3fLyUNUzdFNpSffwgqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141408; c=relaxed/simple;
	bh=7OgipuORHAX8ObMEfy/N367UDPgx8N7eP0GTaImetJw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8vTAdiWP9+dX2ayT58cPKJSCpLyLj4uZr/V1k1lCHMtJP4eVZ2DIycpWpAgILzMhlcWRFyKZcQ9HZ5TuKbmB0oI6Hq427wor23tv9c3uAV0Y/F6Lr1in0y4BAJTPQVfBv14HxvWO/6xsScXsz1/iI4mDdTzR6ScrsvosTz2eTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kc+Bgh5z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kc+Bgh5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D6D1F000C4
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141407;
	bh=7OgipuORHAX8ObMEfy/N367UDPgx8N7eP0GTaImetJw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Kc+Bgh5zPuQ7+YkjD3Y4/Ozt5Q0Qr49vAipXjmhKEB2vv3yPNdOXJBAa+T/DdX3eq
	 G+87v3Bl4MVEpw3+kyNOxOWmUC9ha6lXS3lUzmkfox+tSX0qd6YgcDTnjiLgY6JrGe
	 eUIrW72DW6r0kaAX6NJlSOt1g0OX8ZLP0sAujygZDWnqCygJK1A38muIR+JcOKHYy8
	 RG/ATLNrYfW12lqsabbnrqHjhsDBVdNkq1U4o1wZzcZrI5uPvFK4P5AzdtdS9jgLb5
	 L4rFGCSYYGr05XxIxqdCVauKJI2CNgoWLTvAFxH2164bpNNqOAqxPMjZi6CnF1rKrg
	 +HrBrV42GXQ6A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso257094e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 02:03:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzqSiiKsTLfmke/w3NGbtP3H68vF2ZH9W1RszIO9jh2kyGcp/dZeejMXmmkH1cQg3o1VGmlQJHODkvB@vger.kernel.org
X-Gm-Message-State: AFq9FYITM41RSdpgIdrH+UxawpOfxhsjD+141sKav4dVCtBKWtH/59GC
	KRJQ6PwdujqC0jI6Eka79x4mfez8ZH3iGDwZXLVkmtAOaUGcZ8/DvDhW79qRvyEYbiOZ4W+VjgK
	ku5VVXtt4WIvV+cMfmFaE04zPLkFG3YCM82IyGkj1tA==
X-Received: by 2002:a05:6512:1289:b0:5be:4d37:3bb4 with SMTP id
 2adb3069b0e04-5be4d373c38mr291512e87.61.1792141405786; Fri, 16 Oct 2026
 02:03:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 04:03:24 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 16 Oct 2026 04:03:24 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261016074704.1860749-10-aambrozewicz@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-gpiolib-event-clock-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168236@kernel.org> <20261016074704.1860749-10-aambrozewicz@nvidia.com>
Date: Fri, 16 Oct 2026 04:03:24 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mc89+8Vaxno65wepjg9MwSNeHZGtb=FQ0QVAv7rAZYLNQ@mail.gmail.com>
X-Gm-Features: AclHuK87M9OI0S84s6vF0MyaDQrPoMPjWH_5x379Ibzo3rkIDdE-KQJiBXhPZCE
Message-ID: <CAMRc=Mc89+8Vaxno65wepjg9MwSNeHZGtb=FQ0QVAv7rAZYLNQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: clear the event clock flags when a line is released
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 09:46:57 +0200, Adrian Ambrozewicz
<aambrozewicz@nvidia.com> said:
> On Mon, Oct 12, 2026 at 02:05:49PM +0000, sashiko-bot@kernel.org wrote:
>> In gpiod_free_commit(), the ownership synchronization token
>> (GPIOD_FLAG_REQUESTED) is cleared in desc->flags via a WRITE_ONCE() before
>> the function finishes cleaning up ancillary state (debounce_period_us) and
>> emitting the GPIO_V2_LINE_CHANGED_RELEASED notification:
>
> This is real, and older than this patch: once the cleared
> GPIOD_FLAG_REQUESTED is visible, a new request can set
> desc->debounce_period_us in edge_detector_setup() before the old one
> resets it to 0, and the debounce code reads the period from there.
>
> I'll send a fix with v2 of the chip-removal series, which touches the
> same function: reset the period first, then write the flags with
> release ordering, pairing with the test_and_set_bit() in
> gpiod_request_commit(), so that a new owner sees the reset. The
> RELEASED notification can still arrive after the new request's
> REQUESTED one. Moving it before the flags update would report the line
> as still requested in the RELEASED event, so the fix will describe
> that rather than reorder it.
>

Will you resend this together with that v2? Or should I take it independently?

Bartosz
