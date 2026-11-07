Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011251;
	b=Q7L/dmjamRDMyVF93rja+/3PEI/tU/35FenYzvMcGa0v/bL0oT6/KhNoGJzAu1y31ldq
	 Nrdejafjp1/34sFd6jWcKzQCG7pkd5i3M+zy1wraJ7R6p3Fwc+mWMdqIRp1Tddj9P6vJ6
	 S0YKWFIIP3zYPOEiUZx/3eKmO7CNII3fAa/BBsWCHaX524OkmGd7E9Y1CqzRdzeVPvEjr
	 zlm2mfwgEKQDMFssfNmXCuJkqVMP0kEPZquPHDP4wmwhtXOVXHh2esvfR9L7xZVQnv6nN
	 qlPbuMYAkSTVU8MF9BINqq/D3ab1l5uo3h3TIEKo1XVo2CrmK1LKdLCg7ZvgN1VQ8fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011251;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
	b=MYp6Ega4kFA1rGXHezzEArVaYkFJ68JZqiqzSbxk1Y6qoa8Ka4yGjWut6QTtMk4K3sPm
	 O+9cEBi975a3mXjZyxxb1Eo6/Jd2uf4Mg5Z1Aim/YZr7MRbbTh92aN4sXaQxTYe62qRFc
	 rnxjWk3pjxCGOQ1uhwWfLr4MoVbpu+QbJ6/r8tLtg1JnGLaWxSeQaqQLftoihObqKC4bj
	 FuexIia3wmvGP7z/wCuocFdJmHR49+WKNzo7TxZbGTfa5YBiT4QepyhREdXo+BGR9Dyd9
	 9s+MKTSdPJHCpQ5oNgt+s4k6031kfzpdNICT2Jt7mFnn+GgB98jsJF2V2/LR5r8qttA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NOhJhFXo;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VzZBVusC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA394606A335
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 00:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA394606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NOhJhFXo;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VzZBVusC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
	b=NOhJhFXonsPNC3FHPyWTU3WFXRh3+KeYDzvd5Gnjp5f+lkYLeOTpbuaAlJs9virnhF6OHS
	OaCd43MxSS8GUu5C3PRnk34NtbGbIpzEFcERqYq+pvGfE7BX0Wq7HDe79kupRMqsxCX089
	3YgaInRozmZMGAGbRAqdvX9pAbLwSQ0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-k9bDZ901NvKjmB-rX49tOw-1; Fri, 06 Nov 2026 19:27:27 -0500
X-MC-Unique: k9bDZ901NvKjmB-rX49tOw-1
X-Mimecast-MFC-AGG-ID: k9bDZ901NvKjmB-rX49tOw_1794011246
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9440b27c1feso228461785a.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 16:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011246; x=1794616046; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
        b=VzZBVusCaIfSJo9m2kCp9VBm7UYuZWBp+NOOYlJjmmWnoD5eAEPS2DIhO+i13wbOCY
         EEnpouyLBsOH96PbYXaNHIRa8cqSqo6YQA4pl9I9yJa118p1ebQvz+u38M1XR8VOTLIM
         zTB/auLnx/AroCnxF4cMjEhvTZ0pHnJCWbF1wJXTRqmhTkH6cjxLEbDdPII/vRuwd9ol
         PPT8tiEjpROBYccWTGJYE8wRvjeIjMFI4iOtK2ik3Zfc6FqmLtIVLEKmIcQ476VORDei
         ZyfbxsV7tnTzD5YL8LfrXwR+baDPSKhi2EBADLca9X/WzjjWu/lesDlkyLPf24yv20G2
         j0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011246; x=1794616046;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
        b=Xj2LqFmevkjOcn7FUPbJWqmnc0XbHL/O03umVquwJwIPD+WbQyoBQE9iHdgmcKKfYk
         2aCnVoEoR8lX8/7ca5LQl4I3disohEiwFroJMDMxQsON+bke9PGuNmxQGOLOz/yKWOy1
         iJ6OSBsClr7U+zFYDw6Tlx3Xn2HEz5eycFoFhNMdNtJOiRT+qbCHYxMhsC0ulgVWtpN9
         S6OcJiCmJ8eB79hDJKb2tF6Njwq3LqUZjpLpBwZY5yrgsU2qg7XdFS/XJTHku4IFlG0B
         siXHpLwQp6pCza83JkvcDZ27Sqkopo50Zj7ZoxQra4aGDUvorYMzeZNiDwDVQcOkgCjO
         wUig==
X-Forwarded-Encrypted: i=1; AKwUvBwGS9CxtBwGGc2dhhVfIczt9EsKqMbtcue3VFi1o0EGGl6XFhaCykSlvJKHh+1A92001muhGdGoWuAT@vger.kernel.org
X-Gm-Message-State: APuU4Z/SRuUInoFmscYRLyX3mr7HcqcEwddVk5U6VOkTV2n/R2WG524g
	O5VeVjX3bcL2Rg7wIECAW7cRnKvN7DPp/LOSjZDRDSh5yuj5hGvtcSjvWjsqRF/gaMNrYJHK+Qc
	7HkIBuauAbijUv1iZvRc6W4Vu8b8NRLSmtl71L75FY8cKX15vZcufksOu238/Np8=
X-Gm-Gg: AYBFou0kUu03JgHayr8u7e47dVFqg3RzCBQ7dLRArWxWr1Ch6TAVsupauTpXjyV3wEu
	oNtjCvwHLm43CebpE/cepqNzke+qM0BOh59Cy1bjlrz2CpTdl7PauSnnlr8VxQij3h7/xmLQhJ2
	Clm2xMh+gZcxrj2H/JYwUVa1MU1OBb41ba9OWC7MFb9g8/BfHcJtD/IreqQ87uTmLVDyRhuH+ip
	hBU9Nr6TAh0O7QGhtU4QCSdTv2L4gSy4FlANPYeegnQgSZWpoEDrd4Yk5IZumS06vZ9KhcvpRHX
	iJH/6E2MA4c53lmX+zFHjO2x/gh7UR4Rp823BT4uyxNs1XHjYKYYdf7Bk7gqvB/qDnXgl1KCTP/
	tFgrEarbruh1IotjBZzS1jzjfeM81cN3XCdad3TmOhw8YAB6J2IP1fmrH3CuSp7Dm5VqZf42l4/
	RbDlW6sdac+G7664aq
X-Received: by 2002:a05:620a:448b:b0:93f:2aa8:c549 with SMTP id af79cd13be357-945f34d7959mr663754385a.24.1794011246419;
        Fri, 06 Nov 2026 16:27:26 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:93f:2aa8:c549 with SMTP id af79cd13be357-945f34d7959mr663752285a.24.1794011245960;
        Fri, 06 Nov 2026 16:27:25 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm254122985a.8.2026.11.06.16.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:27:25 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] pinctrl: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:27:11 -0500
Message-Id: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMz3YLMvOSSohzd4tKk4spiXWMzwyQjo0STJEMDcyWgpoKi1LTMCrC
 B0bEQPlBlVmpyCcgUpdpaABlM8alyAAAA
X-Change-ID: 20261106-pinctrl-subsys-361b22a4b107
To: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=kDTf9y+UELPGx2xKi0yx9abs7XbPUZFUrGvvsIFq3xk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFWS8zkz9FG+99P0aIWcxOf2iTfV/omf/rJTnNKg4s
 HrjYr+lHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyEz5CR4YhvbvWW+7wt17a9
 Ps5X883+oftzg5tb7ANmLF1StleC+zojw3rTg9s+/2XKuveeN/aHclh7dXVs91ymL4zpv29zKoV
 dZwAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      pinctrl: ingenic: convert to subsys_platform_driver_probe()
      pinctrl: intel: convert to subsys_platform_driver()

 drivers/pinctrl/intel/pinctrl-broxton.c      | 12 +-----------
 drivers/pinctrl/intel/pinctrl-cedarfork.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-cherryview.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-denverton.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-geminilake.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-merrifield.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-moorefield.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 12 +-----------
 drivers/pinctrl/pinctrl-ingenic.c            |  8 ++------
 10 files changed, 11 insertions(+), 105 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-pinctrl-subsys-361b22a4b107

Best regards,
--  
Brian Masney <bmasney@redhat.com>

