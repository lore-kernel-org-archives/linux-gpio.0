Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637004;
	b=j95+5MsSL6UHoJofFBLp4muEpq0QWE8AquCV2zNRpg9M2Gx46TJUl5eextKvipyDspuG
	 BO30bfcRbcCKX4DtaiIK4ZPBXANUScgrj4PsRCoWuXt/r7uQvSv1l698Ae2rWs21gy5vU
	 OW44A0o4hholqJg35KcCzCNsSEqkujK9vqVLOC009IQrzjVMIDPUwx/qZSCrz3e7TqW8/
	 zPVtULdhPw55pNWKgCL8d/k7Axoz9Cu68xb/C5p9scn3a1tGI7OI5JKMnwDlPMDGRDhRt
	 b4djmMpZEIiKMzZCzawBxSn5avsv+RTcfGITLhHynbblH1Co+8aYdQu0D1Acl9y/uhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xLBRusOCzgaX2ifJa7rH6HLwuWuCZ8NlzSUvqTQo+pk=;
	b=dOhgh/lUhGKgofL1t8R9bZci/w++ybH8Wh0AGfITMR6EcRKR/o7QMa1Xtf05tUYYtGKi
	 ZAfcfpGGgFXaNVRB4todapvobFcVthvopmtfG4hkpio4g8nLupT9Sa6zNp1nAqv3lQlmV
	 JcN8DhG6za1xyKRmOeFdKnwOtDHvWPsa6CAXcpgkEuNU9PRXXLmZ9h987nIeSYRuB2vK+
	 lLaPu05TsJCoTuxgCBDUPx2yg+R7w2HXVMxOh2nPaDmR4hgWleIl6f+iL9Lror2Szr7CV
	 b8/vrwK9NwREnf+pMUomDE7IvsMUCtjUonpBj2BTUrWade3Gk9leFSNaydPtJPRRNYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="lEOeH/dn";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB348606A31B
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 02:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB348606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lEOeH/dn
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14394530ec6so1817725c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 19:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637003; x=1793241803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLBRusOCzgaX2ifJa7rH6HLwuWuCZ8NlzSUvqTQo+pk=;
        b=lEOeH/dnS2B8e24Xu5MT/xOA4CXNQvVwRiWzn1q6J5IGjpptVfq5b+/5WRy4Jt181V
         kQ29p1mhMmGtlWmQjecdyuM9lpfn/y4VoKo/3iQ1IgrOZB13VGtGi4Y6L0I+2JApQ3kO
         dPAV/vSznGHQxXrgTK1IHecyiseu50E0Esu2XY0JE7ibdN6RHcmkq8KW/SsvMkejqIGt
         1Y/fJ3etsqCdIKvSJHmOhiVlH1g5+NXiS81QoK9vakry8whH/+pbLTS2XS9lwtKKyv6g
         +arvr34PT3qOsU7/zeIn09hT3IvuLN5fdyhHSr1NF5p3K0vOfE3yU/UcqQXB6/gycC+O
         htTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637003; x=1793241803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLBRusOCzgaX2ifJa7rH6HLwuWuCZ8NlzSUvqTQo+pk=;
        b=0A3VpwhoTz8KjBSW1VNra+34S1hHPv+w6+TeDas/zyIbxZ4KUq3LXka+2OHn0AjlB/
         cXuxkfQ5JTRQa4WvdRGgMQno/Dm6n25w2nF8Y6AjuArdDMpspkof1sfwWGYxvY5b/dId
         zqEhqwmx1FtFWPdv/8watdQin6DJ4h5bNbhR4o0/QQaTHmwzuYKdbLeHEXSVKcg2SafR
         778nWhPCZ7O7H4otcbFrvSkw0qel0PmactanrwtnVXsgzlRY3CB85dMDD5MrIUpzdn3/
         eWiGEv/Jr+lXWYp0PH9xxOqUHgY6lpEWGH+8mXM2DKjn++uZBlywRKeKUaUcjH2H3Ddz
         LdYQ==
X-Gm-Message-State: AFq9FYLIDUGic0P2AE2ZXm8Dmka7guWf59kQ4Ovo6aGEev9x5Y3Egrl2
	2be2ooBQYdfEaAK2o3reeviZzw3abpsUeDEEb8noA7CjG3fyfltmLGJk
X-Gm-Gg: AYBFou3NTmDLT/z84DC1TC6sCkPF/lLA9iMGJOFhRLQiuekIU18t5A/5kNc714g+rQL
	PLua7YGv5HKPtmglthLNB1iFJgpVOp8Z+j/VvyqR+xA7CiA3SnF2gVYHFcqIqImWsYyHucZWKtT
	ABDskOVqVzbPaS7pVNkpGeUXIM8MdUQ3ollj1lECL+d0zKHhU1yDa1zfqvNyxN8RvJYEa5G13Ti
	7wEBS40+byXr0XEP0Cvfw+ax0auf/VZdJzAmRz8/DMdU56y50ynFF6XuQ8APx4Vv82ddbbomcs9
	qCx1V5OdOfPRlD0XHdHEFMjf7z4rgo1HixoyUBIyD9I/4fwypHRAl4JU02/OCohpD5bQ3otGSD4
	CwMp7MEVrYBfZy7YglzlDW0J80JrjEEKlasw2syr+jnU7tuYEvRkqSCEDNymfV+triTycOaTxDd
	ij0o+UXhx9rr8A7haAXmNT9+o14HNNsgVmtV+XJ2wTkdfIdMNiN9hhyLTTZG5jTuWwPSbR0uuq5
	+BmIBNNI9564XFFCMCGu9P1eZuvwsC3p4en1KNimTJmCtRIppDrDpbvgBKURKtEhI0dSl2LH/mD
	S4SW0rd3h3w84VjeIw==
X-Received: by 2002:a05:701a:ca01:b0:149:1feb:6da4 with SMTP id a92af1059eb24-190a5e65d52mr5119789c88.32.1792637002767;
        Wed, 21 Oct 2026 19:43:22 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903ca044d4sm11077386c88.17.2026.10.21.19.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:43:22 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linux-aspeed@lists.ozlabs.org
Cc: linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	tan.siewert@9elements.com,
	billy_tsai@aspeedtech.com,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [RFC PATCH v2 0/1] AST2600 global GPIOP passthrough handover experiment
Date: Thu, 22 Oct 2026 08:13:13 +0530
Message-ID: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This RFC v2 explores a different implementation from the October 15
GPIO-request callback. It is not presented as a completed generic fix.

The intended software model remains ordinary GPIO power control with
x86-power-control software button forwarding. No board-specific sysfs ABI,
Devicetree binding, or per-operation userspace SCU switching is introduced.

Changes from v1:
- Move shared-enable handling before pinctrl registration.
- Preserve global THRU selections in per-pin SCU4BC controls first.
- Handle the SCU510[28] source using SCU514 rather than rejecting it outright.
- If handover fails, block affected GPIO/mux requests while attempting to
  retain unrelated pinctrl functionality. Check all group pins before muxing.

Problem and observations
------------------------
On B650D4U, a baseline with SCU4BC=0, SCU510=0, SCU51C=0x1e80 logs
a 200 ms power pulse but times out waiting for power-good after 8 seconds.
The earlier callback candidate clears SCU51C[9], permitting power-on.
The current implementation transfers the global selection to local mux bits
before registering consumers; observed post-daemon state is:

                    Before power request       After power request
  SCU41C                 0x000000c0                 0x000000c0
  SCU4BC                 0x30000000                 0x30000000
  SCU510                 0x00000000                 0x00000000
  SCU51C                 0x00001c80                 0x00001c80

Current implementation journal excerpts (boot-relative seconds):
  182.265233 power-on request event received
  182.267277 control-power-n set to 0
  182.467530 control-power-n released
  182.496345 power OK assert event received
  182.496404 Moving to On

The logged pulse lasts 200.253 ms; power-good arrives 231.112 ms after
the request. The operator confirms physical power-on, including after
complete AC removal. The supplied timestamped trace is not separately
identified as the AC-removal run. P4/P5 local THRU selections remain set;
actual forwarding and signal continuity have not been measured.

Runtime SHA256 matches the earlier A/B tests:
  eb98e896b67c2742db5ea127a40eecc6d23659a69a635ba9e2c5495bb32bd8bb
    /usr/bin/power-control
  47d323408e754c692f9f8764f2369e8bdbe76f56c59b804f52428a6229a7b4d3
    /usr/share/x86-power-control/power-config-host0.json

The locally patched x86-power-control permits omitted optional GPIO
configuration entries. A comparison patch removes the earlier custom sysfs
passthrough switching and 300 us delay, restoring the original GPIO pulse
helper, including its masked-output handling. The configured power pulse is
200 ms; software button forwarding is enabled. This is not a logging-only
change or an unmodified upstream binary. The same executable/configuration
hashes were captured in the baseline and candidate tests. These source
changes are not intended to introduce different GPIO request flags; the
captured hashes identify the tested executables rather than independently
proving their build provenance.

The image build completed successfully. The kernel base is the local
OpenBMC revision 68da063267662da17b990c3384d5beceab1cdc80, whose
Makefile identifies Linux 6.18.24 (VERSION=6, PATCHLEVEL=18, SUBLEVEL=24).
It is not claimed to be the current pinctrl maintainer base, and equivalence
of its Aspeed pinctrl code to an upstream stable release has not been
verified. Runtime release: 6.18.24-68da063-patch-157ea07.

Open questions and validation limits
-----------------------------------
1. Is local/global THRU equivalence valid during the transfer, including
   PWM priority and signal continuity? Only steady-state selections were
   checked; no electrical measurements or mixed-pair functional tests exist.
2. Is mandatory normalization at probe acceptable, including platforms that
   never request GPIOP? Would an ownership-aware request path be preferable?
3. What shared serialization should protect the complete handover against
   other SCU writers, including concurrent driver probes? Would a common
   SCU-level locking mechanism be appropriate, and which writers must
   participate? A pinctrl-private mutex would not serialize independent
   drivers, and regmap_fields alone does not make a multi-register sequence
   atomic. Regmap locking currently covers individual accesses only.
4. How should partial handover and subsequent registration/hog failure be
   handled? Current restricted mode does not guarantee registration if a
   controller hog itself requests a blocked P0-P5 group.

Protected-write/fault paths, PWM coexistence and SCU510[28] behavior have
not been hardware tested. All presented register captures are after daemon
GPIO initialization, not a direct trace of the handover. Exact flashed-image
hashes and standalone raw evidence archive references are not yet attached.
BMC NotReady, missing BootProgress and LPC snoop failures remain separate
port issues; successful power-on is not full platform qualification.

Feedback on this implementation direction and its ownership assumptions
is requested before extending it or treating it as a generic solution.

Previous RFC Message-ID:
20261015035118.9495-1-prasanth.padarthi10@gmail.com

Regards,
Prasanth

Prasanth Kumar Padarthi (1):
  pinctrl: aspeed: Hand over global GPIOP passthrough to local mux
    controls

 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 147 ++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 4 deletions(-)

-- 
2.47.3

