Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E5745D931
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254726; cv=none; b=qNg44Edi8fpcl9gywT5zFVg6LphedeWiRsO0xTigdq0opuwJ2UlcVWAA1AuHfgcS6zmDXHaAAsmVY91dq7VdjfUbIS2Sp8TMAPV4JS8PTOTjx4FMgeTeRbMSyWoYPNKcrmUmujnRWWMFD4pvD1C8TV/Je5vytsJotnuOjjxa2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254726; c=relaxed/simple;
	bh=q6yHn5fGMRxnAHuvDfjQEiiZwIaHJYlo+J6EXXm+ww8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sllPLgdlO1nEG+RmlVsQ+anx3NERiPFy2DL/7KCHXyvcoavAEelYmlMCntFWX7xnAqQRVHqt2BPjdfo1xhI6gzGTfD7JlQ7GdRJUMpVdoKCzz/3QoYhljg1CAvly0QC/dlg9s1ZTPk/+YDfEbDM6/MbW1TUW0pAdlFPm7qD3IwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=lRYjJw+q; arc=none smtp.client-ip=62.149.158.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="lRYjJw+q"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 9j22xBO2SdVTC9j22xSpaZ; Thu, 24 Sep 2026 14:58:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790254715; bh=q6yHn5fGMRxnAHuvDfjQEiiZwIaHJYlo+J6EXXm+ww8=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=lRYjJw+qHAoR2XK02/cwXmXRHkj2rCzt6tT+pXbx49hzl2AYwrha1cGJV0qJ51/MB
	 BAtejPk6OMlXNZrlWZL3vFMdsM4LCuhyk61ScWKUFVPyvPUAFPhUnEXW95BIQ+/qyg
	 bd/VquN3BF66YorQkweEKDSXwfDsd6h+Y13FkQ1t7giurvBOm/f1AQ4DhvEyMgKDsC
	 pE7q/uY6OOHj/Ctb4YH2Jny8OCK1O6Yede/Y5wFD+b9aGV6BiWJiCKHrE3kcDZEX/z
	 LpcA0x8IaiO2Mg/97u8TwJ5jGM7GexdTuK+9nARoPYVdd+/4YZzk/VcgBkHvYWSGgV
	 C4td0vTeIA+Iw==
Message-ID: <4a62a294-ae53-455b-bc00-d16088684682@enneenne.com>
Date: Thu, 24 Sep 2026 14:58:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] pps-gpio: restore pin mux on unbind and shutdown
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
Content-Language: en-US
In-Reply-To: <20260923182243.41060-1-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFHwDZR6GXRs+CeWNl0DoxXNe2tAM0uFBY3B408AGpZAw6+fJilH+X2xwmoxaJWjTpZPRzP/SAl31/5a7KdR/vSWO6s41eXUSrNpIDHggJmA5BvwEmbv
 v0NI4SgM2dDx8y7V1rer3tSeG0Zle30LV0APHtOCwRSazd0Z6C1xp1DEh2Si+rKGo8IhRzmdQa0pfj6jE++pdjnjoox41/TGpJyXS3gjcXuiWOS4MA5liySR
 uAu5tQPuc8HiTnVfo7XuZ6ZcuonUMJ8kW0OZBQQJuigk0LFh9nzAYVJFbXUeBuSWg06oqD1JnovD3gqffWIW0/ww1TNfZNSwixAcyul2qOE82JeKk1vFSyuI
 U+Wqoe7p8PtBQ4oGdzcJPzaJPOwrWc4NoGaDPA5e/BD1eovqX710UsY0GvB46ORvJRbN0Cr5B9TQMNMFpLsqEvpz07pYovnw6/ufE7rB/5QJqbTj3A3VzVHW
 U9Aak7cVA2JF6p8EDXikIV3pr9nKpTYfWyfg2JJZ0OIAqUESb971mCzAUB1kmGergHf4bCOLSe2usvGJPb2q+m8/KgAatY5SulEIjg==

On Wed, Sep 23, 2026 at 06:22:39PM +0000, Eliav Farber wrote:
> Changes in v6:
> - Patch 4: fold the pps_register_source() failure path into the same
>   dev_err_probe() + goto err_release_pins style as the other two paths
>   sharing that label, with a commit-message note that it is a logging
>   change, not a fix (Rodolfo Giometti)

That is exactly what I had in mind, thanks.

I applied the series here on v7.3-rc4: it applies cleanly, checkpatch
--strict is quiet on all four patches, and drivers/pps builds with W=1
and CONFIG_DEBUG_OBJECTS_TIMERS=y.  I have acked the four patches
individually.

Andrew, could you please pick this up?  LinuxPPS has no tree of its
own.

One leftover from the v5 review, not a blocker: the new shutdown()
runs on every board, including the ones that describe no "inactive"
state, where the free_irq() and the echo teardown buy nothing, and the
commit message of patch 4 still only speaks about the mux.  If the
series needs a respin for some other reason, a line there would be
worth having -- otherwise it is fine as it stands.

Ciao,

Rodolfo
