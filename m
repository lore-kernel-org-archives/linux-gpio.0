Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482660;
	b=v2IN05g5lNQBMLczp6iFH7zdMkDYkVs4+ouzQ0rH94c6WlYxzAO6foJAkHtzfHweDNeZ
	 7+IfC4EwhnSy020riHkJH772KaBBY5D0XzTe8PnKwqVHlnEe/N8pmAGIsG0hVtSPF0ACi
	 87Tshe/iuKfF3dUkp1j1/ppSFvAN6hYrFIS/2hlNVxz3DroqQYlG2QKw4HrHYmtHDkwdu
	 xRVUwtyk67vahkLaWEQeXfDv6QyajRjywlVbrY/vROWyh5lWAUEzlYgb9z9RB+f/xDD2u
	 TeTYUAAAcvMSvbZko4jf/K4C8PSZGhw2GS0cWuOBuZUE58Jmu3G8q+lxV+8QPasG7Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
	b=UUYC1bmhbjBtcwRkyn6T4d6sODAfP4fdZujU05YSdTGBK88k+DWB3IfkYbTuBn7qDSQl
	 IQpZ8C3iBaOAYSjp6eTm2rNM1bVizM9GHchsgtxmhWBm/ZsmZg8n3RHJIPbH1sS8+MpG8
	 cqkHf9/MO89H3v/R2v3huE5JGWq1eO6o25beEdQ66RbkEz8rxuZYTATqQBjnrvIx7vFUZ
	 te72AwiUREM1VU777HqbrQADEcXNRz92X8pKb1qdvOTgnCn/S9iXLebmvL111fYRTtGBg
	 69W4tWNjP4cINY6f25+vhICp5lYdFvvBK8/9LufV7z7R9HkJ/+SQGucvP3aCzN0F1lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKG19Co9;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D5606A32C
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 01:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42D5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kKG19Co9
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso8475195eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 17:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795482659; x=1796087459; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
        b=kKG19Co9tDWF2kSXK9dKvmLlvSosMXN5A+fjtmNUuhQN82VGIHKHSt7hl60KkIuTqu
         OTELZTKud2yzTtGpJ7YssH7XaqMzCZGWMYDkBuT+NcCO6f/J1jqPT0iyZQqXfdWQVo+7
         NpL+BVzS/nn6KT8iZArKwzuxRvPxz7vHEFH6/T2KHs/4S02PCeK1dyecPiT3ra5J0+fQ
         /fgxtsqz+bypFUe4822LHXZAKII+1BrHRYFU9BpYbk+8Uqr0d9LvdyqMqVFfzPKr5ne0
         gjqbIHRdr1UAU+rh9u1Qy9nf2cgwwJCw8nbQvW/s9TlQ/Z33NtjHLWdZggyn3wfRzLHS
         ZRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795482659; x=1796087459;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CwEMPI7Nv8Y4G/uSjVrKaLXUsD6jBVuvooxioPWLmTc=;
        b=1nYMzdsp66Azt7KMYPZHxF3xETCk9Ya6HoMWVlN5m94cGUi0KQWvu13mSQWXrJqt2j
         c5h2JnzBIUaSBZCzeWCAptveo/kQlP7ceFUNsqXccYTMyzCfaO1pJAx3UbFQ2p423x6g
         Vh6YiX6LMl9Zud1T62/AKrq079W6RVeDLPdK4HaI8vfqHwhCD9gIOwJrC4N2WA4yoXUA
         soX4Uy0pqgGKgAd0uHFOYi7j8k7eHRkrlUlpX7KORf8MFehvtm++JixG14GrmN6CWxyv
         1BrRnWDUzINmkr7iYPhzy+xq/7Vi92MDKIO3BX3cyZnVDvam+MIJzOX9TaPf64Ce7bhn
         HrDQ==
X-Forwarded-Encrypted: i=1; AL+hErGMaViEE8EbxUY2GuBumnKRyqZb5r5Rf8H+QbutNSQ8O//v8Gwt6mjE/hx4uAU3uhIluPm0y39zeda3@vger.kernel.org
X-Gm-Message-State: APuU4Z+kq3T+yJaP7Bxu9FKEFNqKJysutjbd5ZKNkKznC3t8ErtrZvlM
	KviEKeacK7VfQUsOuQjzgLERXj7QPIg21W4jYcYHy87h1b0VCpmBqY8U
X-Gm-Gg: AZFdTZdbPomCevTqvHWCrRAEjC/sAmVkIZFzvvjwXP7/IZ0bhJpn8F7iWqyM7An/PAa
	UvyALLInYhVIzAqLh5dRe7d/9o1QvudIFlP+unPYy917dhwMf8EL9v8yXFjQnEwTlTSoBiRyKuE
	JD9PkViZ8IIeagkTDZ1FUSyCX3FvmZx2w5fDOP5kYrz73IIxzsr0SO+w/HNp8a5Z2rIyAT+ZdDS
	fYN0WiCj+R3xNSzNAWNgrdGi5zEjNw8SpAuJxXmyWoMbU0EQKcOjrr2oyi4MlpzSeFGJRJWB4l4
	t2NxsCBSaZKsvE2pArRZVlPwGn4NPpz4F1PPjehHqgn2ccIlxv5u66JOEL0q5sxXJRuI3IGYAvT
	oizYtOgBfzrRrhwMc2nh136WoXwcMKZCAleqMB+28gmpQLEwuXLMw5K6DrB10XcrNg6iKqKCGJz
	8g3J4qPPTDMJ0khoPtM/b3HaoWSEEWwbreYtYgPI/raZTaqXJ1N5eTKTPlWKDA206H5kofCrhOT
	PIT1lgBErc6yvC/Kl+dpq/x8jMGaT9CayiyDyHWywkckt28kbYhVuuYmQhr5xFJGstvafvHXTee
	+Zx4JIekO9UWMCRPzjWdXvnAsndPF4zaNjUABtEuSj0lidp9owV9whRNzLoA1V2AK5+/rw==
X-Received: by 2002:a05:7300:c695:b0:37f:73f9:aee7 with SMTP id 5a478bee46e88-3856c9a6408mr15050898eec.5.1795482658749;
        Mon, 23 Nov 2026 17:10:58 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm15816977eec.18.2026.11.23.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:10:57 -0800 (PST)
Date: Mon, 23 Nov 2026 17:10:56 -0800
Message-ID: <2f25009cbd67a8ee7b417f12b35374b1@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arnd Bergmann <arnd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Gibson <warthog618@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/2 v8] gpiolib: finish the legacy cleanup
In-Reply-To: <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
References: <20261123085723.156933-1-arnd@kernel.org> <tdc6h325jthjgyik2ne4oistkm563maoc2cpnffqu7hh34tpl7@oscripzv4dwq> <qvmy7iaxc7cjy2gkajqkr5ma6b4lwxz5ff64a5zsqrgewkxodr@odbjlv5x3hix> <8296a5c2-0aa2-4fc7-b65b-9d336bc4dff6@app.fastmail.com> <7dpg3x3gkypkznzhuetjsqmk5fhqwuwkc6kupbs52zqh5mibgx@fjow6eodw4pf>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Bartosz,

On Mon, Nov 23, 2026 at 04:41:32PM +0100, Bartosz Golaszewski wrote:
> Can I apply v7 and provide it to the SH maintainers on an immutable
> branch?

BTW, I have the soc_button_array rework (converting it to software nodes
and dropping "select GPIOLIB_LEGACY") on an immutable branch based on
v7.4-rc2:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/7.4-rc2-soc-button-array

I recommend pulling it into the gpio tree before applying Arnd's work so
that x86 builds with INPUT_SOC_BUTTON_ARRAY enabled no longer pull in
CONFIG_GPIOLIB_LEGACY either.

Thanks.

-- 
Dmitry
