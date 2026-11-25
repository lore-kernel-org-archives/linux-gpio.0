Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617434;
	b=LYJQtpzI4rSQvqa+TpU5bVgr1iXVghg0zb/AZi3+pcnir45al7G4eZlHu4mbUnkUtIKo
	 zgS31d+8MdU4y+1NyYf0cL0AX2kHkdBjCCSLPE/Yo4Y1J+xKNbgbjXPnlUEntaoKznCum
	 6mmJ0WHLmw+Y+a+iS0Hsq3awNMdeGLm7jCrrTl6HaOj+Eb8cJUlaDit80lYU62bxWq7js
	 NC7ElpQu6xDyRnu8lCC4HSLmyYdEU2jpiEObWCEBFc+6uIzlE75cr598m8nZZBKqzQQUb
	 yCX0XmjyeLSn5hxu/QWB2VVBAXIKkVqz3P22geou3NOZ9EbPDhRiW79nZDBp9W9aHuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617434;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P8pYOG00MvyDKOpmsR267gVRzNmWDRkPPMEzuqpVknU=;
	b=rAnh7yPJq/0VZ8P/hq8M/AJrfyNRi848cv1jHE5UoUOqt1WKLXirmMhk7UWCbv4zIGrf
	 9Mxbie0l1nj9IpCbLlFTXFv1u2u6wbblmsLk6x+aUF9KP+2bE7oibZ2WmJf662ncg40wn
	 l7kqzkkRzH30mhCYI2OIUhEvtKSHOib/w2wSjbEmv/AGJevUpYv/goTgB5mESGSyimI64
	 EU/eNigVHzej0dXwJpBLZAYXR7IPfhjSQS8KvrUYeB6zPzKGdgGvOUE7S2iA0IZA0FiLt
	 I4iO0DRCYwHHinEWyTPPeuyFv34cRlSRq8b1TPUiB6m871A3uGZdiYn48ezmJGqvfrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnMGynFw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id E1055606A696
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnMGynFw
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8B0F41F000C6;
	Wed, 25 Nov 2026 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795617433;
	bh=P8pYOG00MvyDKOpmsR267gVRzNmWDRkPPMEzuqpVknU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XnMGynFwYD2OTDw8t2vT1yoesEDFg1DkUH4arIljkgmwnpq9hWHREgjD9vMYngLi+
	 jPjwz4dPSnFBq9+UTbj3rMUUfNo8gmvtl/wU/KUE1OS34nzO1gDElZSEdICwE2mwI2
	 Du8g9QsPXKNX1ranB8Jl/2YvPtrqrneRGVyq1jAKFqTwc9bOOgu4nNfgfFhB4XwgMu
	 lsK+uE/zkA44tmRqXlu8o8PkOVNwxv1J5qef3ssdvZYNicQNilsPuFfS8Xbqs9dovG
	 xcfmUnolsB5bbjAJWKSL19p4+7Cx/DH+QP1QTl+R3N41OAWPPO4UP0bnfAlMo1PqUf
	 b+JYdb3S4XX3w==
Date: Wed, 25 Nov 2026 15:37:09 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: linux-gpio@vger.kernel.org, Khem Raj <khem.raj@oss.qualcomm.com>
Subject: Re: [PATCH libgpiod 0/2] dbus: client: tests: fix racy gpiocli
 monitor tests
Message-ID: <tfzu5v4mtyu7c5ocwxq4icvbktlp4owskpvkspmt5nm44svil2@7k4yry25o7ke>
References: <20261125080045.2410076-1-raj.khem@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125080045.2410076-1-raj.khem@gmail.com>

On Wed, Nov 25, 2026 at 12:00:43AM -0800, Khem Raj wrote:
> From: Khem Raj <khem.raj@oss.qualcomm.com>
> 
> test_monitor_all_lines_on_request and test_monitor_multiple_lines_by_name
> toggle one line twice, with another line in between, before reading the
> monitor output. gpio-sim can deliver both changes of the first line as
> one interrupt, the rising edge is lost and the tests fail intermittently.
> These two patches make the tests wait for each event before triggering
> the next one.
> 
> Running gpiocli-test.bash in a qemux86-64 guest (kernel 7.2.15) whose
> vCPUs were pinned to one host CPU and kept busy, it failed in 7 of 10
> runs without these patches (both tests fail) and passed 10 of 10 runs
> with them. Without the CPU contention both variants passed 30 of 30 runs.
> 
> Khem Raj (2):
>   dbus: client: tests: wait for each event in
>     test_monitor_all_lines_on_request
>   dbus: client: tests: wait for each event in
>     test_monitor_multiple_lines_by_name
>

Hi!

This looks good but can't we just squash the two into a single commit?

Thanks,
Bartosz
