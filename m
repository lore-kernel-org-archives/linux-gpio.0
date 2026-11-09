Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236268;
	b=fFJNd63WpD68LsLrNoWznNu/uVAZj/HGRnufjK6jfYiKRhjoiJadi81aVFKiI+Qk4gW7
	 o7yu0B4hkIi0BXlItD8tPRRqOTKWgf3I/JQYAr8ZrSTFda5ldzMlXuHgNBGfev/o6jpC3
	 k//Vum/iXo/s9+zRhptPxLCqAT/cmIBiR4Hz83hAGqSxSbKrTxzgE5BDKSUZav5Hk+ZHC
	 R0OjSJq28Or/44qK3T1ewDcPomh9OS+ncEyRigPbRHOFhfKcTXL5LCisfUllvZnczWV7t
	 hOke++147zfHLg9Oi9Y+/vt7UHtdQDBsmBSCeTaaWV9IK5Yu5kBbu6TIFZ8jbjBYChQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=hRjp3zNeYZEXbMRgqMk3H7Wd6UchDE4bs/2J3LLEC98=;
	b=K3JZO6WaiwZc15CbLVLZ6hESIy4nqQPgyynZScf3EpWO7BtP+CRmRXA+AS3qcGC0tiTH
	 o+4w0QMdlerxhtSGrgoLoxHsV26iK9h/bQxvrYr9QmCN09hjgiEIrn4yst8sTj2/v0I3G
	 aBPy6xAitnYK4btBn99H3WUXpWw9SDyQYgsfm6Vnyvy+NFK+XPIQvBs6HteK0jPO10lHx
	 6NhDXxekCY7AfqUCBEgYdItGU6K6y4yWRyLuivgg7NHI5wN3bXVep0Ydfd2B8MEZaIHp5
	 QWQNMYuk8vppU9kpaELYiIDToE2iLT0Z3YwL92/OIjEWG11sMkU4QBKxDptfyRG5y9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=EsxP+GHH;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA20606A322;
	Mon,  9 Nov 2026 14:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EA20606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=EsxP+GHH
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jNXvX3k4lz5B100;
	Mon, 09 Nov 2026 22:57:44 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794236264;
	bh=++mj0Q7h42/3l8+WlkcCdVNCn1pHefssloPftCNBedM=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=EsxP+GHHgBHFMRaE5Cs9YSYu+vpXHEev3Fh5yG4Fk4brOMFcnF+xtoP7hsKzsvRGm
	 Bgk+yA8zyAKPn4BCrl/auW+tGJ8PQ2FAWWr0ScJ1WJqIKHVSSZkVxwZEzVa6C2RD0X
	 Uwj8b2FgsN1t+WCv79eLw7h8LYRBVL2jh0PA2GRpCj+WWzyJLpn481q5ixQWCnenDF
	 Fv2o0kZxv2a2WvMrFZVSvRbYdKsrG/yQMVxWKQ5KCl5aP1qbqxZgWEHXIZ8oTIRRfB
	 T62TEgAwCaDfOmi4T+NoSZh16xfv6BCZOtm2nVvNHZ9WwqJbdEtvuClob0q9FyeFRK
	 qdr6Xl6by5YUw==
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 6A9Evcs2092606;
	Mon, 9 Nov 2026 22:57:38 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 9 Nov 2026 22:57:42 +0800 (CST)
X-Zmail-TransId: 2afc6af1df66c1e-639f9
X-Mailer: Zmail v1.0
Message-ID: <20261109225742262d80cMSH5Seq6HcOxwIe8B@zte.com.cn>
In-Reply-To: <CAMuHMdXHSU3QLanoVyAr3a5akukwDbCHWYoGiLT8HfuCGvHmog@mail.gmail.com>
References: 202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn,20261107161252647FthWsffiqzpLz7zrKd2ux@zte.com.cn,CAMuHMdXHSU3QLanoVyAr3a5akukwDbCHWYoGiLT8HfuCGvHmog@mail.gmail.com
Date: Mon, 9 Nov 2026 22:57:42 +0800 (CST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <geert@linux-m68k.org>
Cc: <linusw@kernel.org>, <brgl@kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andrew@codeconstruct.com.au>,
        <wbg@kernel.org>, <opendmb@gmail.com>, <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jelonek.jonas@gmail.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzVdIGdwaW86IHJjYXI6IGRvbid0IGNsb2JiZXIgSU5UTVNLIHdoZW4gZGlzYWJsaW5nIGEgc2luZ2xlIGxpbmU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A9Evcs2092606
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 09 Nov 2026 22:57:44 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF1DF68.000/4jNXvX3k4lz5B100

On Mon, 2026-11-09 at 15:40 +0100, Geert Uytterhoeven wrote:
> Hence setting extra bits in the INTMSK register does not enable all
> other GPIO interrupts.

You're right -- I had the masking semantics backwards.  Since only writes
of 0 to INTMSK take effect, the 1s written to the other bits are ignored,
so the existing code masks just the one line; the read-modify-write
changes nothing and there is no bug to fix here.

Please drop the patch.  Sorry for the noise, and thanks for digging out
the manual references.

Best,
Shao Mingyin
