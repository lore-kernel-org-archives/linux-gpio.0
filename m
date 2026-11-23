Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433937;
	b=cW2FmQZvdNPZlDZHRLbw8WybUcJQSUiJ1kz5Oc6PuxNPLjfxcT7YT/9KU1yn9KT0ysqL
	 Ng7jc+PxLm8/0o/c3o/5J5boHKnPX9neWUNPy8BQycgoaIgGExefZ3ixlzLyk6n6L1max
	 cOpM/2PVSzJPI1n0JSdj5QOaez0eYO3QrIW1O/3hCgr6Kea7WfTyJXuQiQ48kU9xqx+RF
	 SKtTl6t0EAYF07on17VltYkl29jnxXkyCDDdj2lJRHv/Br/eNy/hckkugF0ZZGLwsrQQS
	 rCAtrpqWWDMXXEQfDMINB6pIwpLN/z+cMAdk0fK5as25GUnGJE6OQkGHGAPJk+x2m8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=DXr0pXHD3bRMuhs+z9S3qmz1LdcfanyjhhMk8486lYs=;
	b=bpS5pbv5OuVGHPik8MITeNsM5xfMPdz25DeHXQD4jM8i4+KGXGYqhpOkQVFEEqRJR0rD
	 8P4fxYtzcs/Q9ec7ohedjHQRraf5D/V7uu9PXvQ/xayUc9lB2IJOWM/492VkIOVOXd9wf
	 u6HJfsBafWKRSpnq6y3Ww59vrECeCPMHLjyxcIahMrvRvgCC1HyDQTnozXZ3d62cpOE5/
	 xooB35S/fYP5ryhG36oUM0+AStVOiFnKvYVNJGPmoNEoWEGs3dURVWt6lz98HrLch/29p
	 D/JqbTV46y/vGN8RUOBTwR9ZcYjMcZptlYERlB+VgsnDHOhG17jWjGw3XQLD6Q75RIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=hHxmnXfG;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E45606A31E;
	Mon, 23 Nov 2026 11:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E45606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=hHxmnXfG
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jY3qN4pFMz6Mv3;
	Mon, 23 Nov 2026 12:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795433920;
	bh=bpCvclBnqTFpGqJDi3k3TXF12kr9zYWAAPKnUQdM+Ys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hHxmnXfGaV6gtwR1p/Y7UOMXqWyXPLF5fVG40GmvkkMHUIuPcB1obwxI3U/KCbsVa
	 xjAQVl/w4bJWaZqfPDY754hKRxLgL2MtEiLX3gj4u7m/5PKSaBUzQFadwlEJxdgz0f
	 5f5qSdKe6yOLF6XJyPa3AQKdcZmI5orisNMh8qsry09Y+R/q4nN3NoRT9YtcJLuvww
	 bR3VzlvCHFE/8M+frvG2QBUXAG3qwMrPBB02hV0yb0ipcPxvTbzypwqjBjwyb/c+ki
	 VeoECKG+4NK7dJhgyTPhC0MrfVa71l8oHmg3l8DziWeL87OOP+ZBANVDIz1SuRzg6Q
	 l+EP9Z79oabWA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jY3pS2P6Gz4yrS;
	Mon, 23 Nov 2026 12:37:52 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jY3pQ3r1Qz8svX;
	Mon, 23 Nov 2026 12:37:50 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 799775F837;
	Mon, 23 Nov 2026 12:37:44 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <329cd215-d824-44be-a1dd-3ebbf5c0803a@leemhuis.info>
Date: Mon, 23 Nov 2026 12:37:43 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] usb: core: fix failed device driver probes, add
 pre_probe
To: James Clark <jjc@jclark.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>, Bastien Nocera <hadess@hadess.net>,
 Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Nelson <robertcnelson@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 regressions@lists.linux.dev
References: <cover.1793669297.git.jjc@jclark.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <cover.1793669297.git.jjc@jclark.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179543386507.1524621.15830580690752356180@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 799775F837
X-NC-CID: t5w+dL6WwtxG3tWCMI8WeaTrlJSnO3BdmPMvXavSdnkLoYzMeOI=

On 11/3/26 04:34, James Clark wrote:
> On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
> f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
> no longer boot to a usable system: the on-board USB hub is re-probed in
> a loop. Patch 2 fixes this as Johan Hovold suggested, with a pre_probe
> callback that lets onboard_usb_dev defer before the hub is configured.

James, Alan, what happened to this? Looks like it feel through the
cracks after Alan's "This is all starting to sound very complicated and
fragile.  Isn't there any way to simplify it?" later in the thread,
which was more than two weeks ago. Or was this regression fixed and I
just missed it?

Side note: another regression bisected to the above mentioned culprit
was reported recently:

gpio: shared-proxy: open-drain regulators on ODROID-HC4 fail with -EPERM
https://lore.kernel.org/all/20261115-hc4-gpio-shared-od-1@iav.lv/

Doesn't look related from a quick look, but well, at the same time I
wonder if there is some subtle connection.

Ciao, Thorsten
> Patch 1 fixes two pre-existing bugs found by a Sashiko review of v2.
> 
> Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally.
> The -ENODEV fallback that patch 1 changes is not reached on this board.
> 
> I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
> merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
> agent identified the problem, explained it to me and proposed an initial
> fix, which was revised numerous times on the basis of comments on v1 and
> v2, my feedback and local Sashiko reviews. I verified that the series
> fixes the problem on top of v7.4-rc1.
> 
> v3:
> - Add a patch to fix existing problems, as requested by Alan Stern.
> - Patch 2: rebased on it, no other change.
> v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/
> v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/
> 
> #regzbot introduced: f918e3804498
> 
> James Clark (2):
>   usb: core: clean up before handing a device to the generic driver
>   usb: core: add a pre_probe callback for device drivers that may defer
> 
>  drivers/usb/core/driver.c          | 42 ++++++++++++++++++++++++++----
>  drivers/usb/misc/onboard_usb_dev.c | 15 ++++++-----
>  include/linux/usb.h                | 14 ++++++++++
>  3 files changed, 59 insertions(+), 12 deletions(-)
> 
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

