Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593650;
	b=QJRC8HmiuN536coFT2Bq1Wptcpo4grHpQrxxNktKNh8g+FjE0lO7quq3YtsyBIelW8L7
	 SXyY60jnI1zAmgSbD/Q3+c7nxe+6p1E7/FH96UEVLNpaK04pf/1X/vvLO1CmO/uDvs7vI
	 Muqih+88JvXvYDGZXo75apJGz1Rl/PnT6FR4FcBvmnEgg3HNFQhFpjCTr0PcgyOn0O/oV
	 Ps7CUibnuH//hy10L+xNeoez8FYGpinNq7v0uGTWlIEF/tsY3giNqOlWMXQDnp9d94KhH
	 lbL16pQR5RzPn3MWcdFoILCLCrtMQkLSkYgtU6GED13DHLZ3NPNRg9Y4i5Fe9vLB01A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Iv199e4mSPIpfJINC4mFPnrN6hOMStEhU6/ZJXdCbUU=;
	b=Lxl/SM6ewp0Fg8wlWv/XfyQ1fKSvRFL6cmxUGyGggF9PSgMLGwKcq7wiV2WQyk2KFEQ/
	 qmk3aMaEgZ8+YM2I6VPRvieq7vbTCXOmixusONOhgaiIvaYsKipcCe1Icel87KBXjuUA2
	 G28F3ucb7A76oGFDNMzdvxjt97onlNlvkZydD1gNB8OD0hY4LdA5W4YIjibduxIeeLCIQ
	 39nuK5aftqDYRdlPRi75LplYOkJMF1ayj/ga/sftfWQtfTcpTI54/sOSsBEDKWnR2TzwI
	 bxHrXmk21+9M4FTTH90UJ1dh5JMWfMq70GNQPn/BFsMD9px8jTiPx6PIgj3EsMvI9Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hjbG/fUE";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C659A606A686
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 08:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C659A606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hjbG/fUE
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so8048292eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 00:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593649; x=1796198449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iv199e4mSPIpfJINC4mFPnrN6hOMStEhU6/ZJXdCbUU=;
        b=hjbG/fUEQqgnPvv0lxjid0gRp55RYLJB9jT7tP9z7Ndr068R6O/6bdRi/S6KbJtF11
         6lZS6NsI5kiG87VEfCXkqPxTg2nTy9o2pbEv3k9B1+AcLhKurvv9r5TNcNz/r6rWxuiL
         YY5pMUCtrD3TVsPv9yCH38+Brp8g+l9QmnrEOahpoforJr1ZyXFx29mmfgsrt9itrfT7
         m5F3VGDiN58erXZ+/vnfhlRilaP/2O2aIsCpH3tGfS3jrXyH56YxaC1SE7SfvShsMzwn
         tdWJ9Ez8jwtMdiDyIsULDnq1EMR7KuTwRk+4ujghDNEpjYmEv/HNr/swcc757QvCH/Q4
         VrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593649; x=1796198449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iv199e4mSPIpfJINC4mFPnrN6hOMStEhU6/ZJXdCbUU=;
        b=Rt6CPZhm/+GgpkMhawMPisKXt8cc5CTBaLk+KOy5A89gJK8poc2yNty/7Q8+PVy7RR
         CRM8Wc8bibePtB3JD8At7Arsj8DuhNZkEJbjerhWs9g1OPu/bngFlY6Ul32rVnVokxFI
         s97vFiq9DpbmD+gZWzi3xmIYIAXk9DWq9SkpYM9tWXGGrcfVA71roG8xaG5LT+jlPZ0f
         CscEFbyvhKmafoAgNtbax71NuUu1a+EkFYQizOHKHcqtQDR+XSOKmTUCbAqJhSvbU0q9
         ofLJgECmUD1n36TqRGEsFSIOhB7ubsWzuJ9e25TcP9n15ownQy9DjLTWm+idAxcjOhtl
         Cacg==
X-Gm-Message-State: APuU4Z+IszcGXALZAweWkfGT+UQwU6zdaEO+9mqzmnzKGIhCO3ZIrXaz
	HXO8H/XifI9A/8ONQ7wN/ppiAhDak++H8sleawuF1NUl/KKRwSynlpIbEOXc6zVb
X-Gm-Gg: AZFdTZdg5oyKGRQgp+hr6TS/DmTkDaY3MG0GaXB4x5kaFBimpDIMXXrawqk0THIu5tk
	umpSEzryf4bPR0ieBowLs9n+rq2Z8jMqyTu0233FmTOsnaHt2FkZG2pd9085ua9KogSn6U7jPSC
	oDsFkFj1vzapym5MJ/wNleIFPPgrrDcCOFg6UV/w7dgJ+QlRQAFZiutqcy6o1YzGwe8ERGkevOU
	CWyJxalyqpUTiF+roAfkS+JD/cr2KKAcScglA3GG8lV7ax2qZs5LnywMXEEqsZkiBPPHsVuqIqO
	A9SRT19kQcDMAdXGOGIIKZBEtH3olt36JCdghFSnZB3XGf1187vXkelo28ha7wo/u/9sxYS2vhy
	bIkF1LulBOJAL5+ocqzg0n9MmuhtjZcfrHaOrQ+tJMChHAVQe4dw+urzEJ/Q9UexzgjbWSlwM7l
	WCq97g1KNC8SY1nrTD5vVUH1zjVt3HVU6R9EtjBSoTChrMkmoOVlpXuShR0Q1z+RujnAb2GLJRz
	j19BDK3se0MdW2YEUL5nrUecqsQQN16RcsPZ/O29lPHEnW7IuVco0MvYE3aOJfsAwBnvVUNrNBz
	9k8GVRGFVewgVRYrEtdoeZgJVv6OvuiC/ELgONkuJ+iW9ObSI6BtkY2Ip4ihbH4SHAthsFPVsT4
	RRsqiHQj3iFXDuswEioTjkGgHgfkXx6TUsBhQcqlWl2LvsEBlc3Y3opqsNyPB4n2Ga66RL+lSra
	KAw3EmJVOKNK0d1Sj/8cgwGm7x40cHj27/x0pPnz/K+iIcC8rIxq7UslGnuJQwIX4Cf2OpMNaLb
	vjDJUfvCBapejrz3SRvxLnx/lonRJdgeh6ALbkabLb5SKnbJW5fayODSUq6ODBLvxSGTQg=
X-Received: by 2002:a05:7301:2419:b0:367:185e:867a with SMTP id 5a478bee46e88-38571027a5dmr19213613eec.38.1795593648676;
        Wed, 25 Nov 2026 00:00:48 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18408101eec.9.2026.11.25.00.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH libgpiod 1/2] dbus: client: tests: wait for each event in test_monitor_all_lines_on_request
Date: Wed, 25 Nov 2026 00:00:44 -0800
Message-ID: <20261125080045.2410076-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080045.2410076-1-raj.khem@gmail.com>
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
Content-Transfer-Encoding: 8bit

The test pulls line 1 up, line 4 up and line 1 down again in quick
succession and only then reads the monitor output. gpio-sim raises the
line interrupts through irq_sim, so two changes of the same line that
happen before the interrupt is handled are delivered as one interrupt,
and as edge detection is set to both edges the kernel derives the edge
type from the line value read in the handler. The rising edge on line 1
is then lost and only a falling edge is reported, timestamped after the
rising edge on line 4:

  ASSERT: '41610700648 falling "foo" 41610665414 rising  4' did not
  match '[0-9]+ rising\s+"foo"'

This fails intermittently, in 12 of 20 runs in a qemux86-64 guest.

Wait for each event before triggering the next one, like the gpiomon
tests in gpio-tools-test.bash do.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 dbus/client/gpiocli-test.bash | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
index 5160f57..ede69c9 100755
--- a/dbus/client/gpiocli-test.bash
+++ b/dbus/client/gpiocli-test.bash
@@ -1421,13 +1421,13 @@ test_monitor_all_lines_on_request() {
 	dut_run gpiocli monitor -r "$request"
 
 	gpiosim_set_pull sim0 1 pull-up
+	dut_regex_match "[0-9]+ rising\\s+\"foo\""
+
 	gpiosim_set_pull sim0 4 pull-up
-	gpiosim_set_pull sim0 1 pull-down
+	dut_regex_match "[0-9]+ rising\\s+4"
 
-	dut_read
-	output_regex_match "[0-9]+ rising\\s+\"foo\""
-	output_regex_match "[0-9]+ rising\\s+4"
-	output_regex_match "[0-9]+ falling\\s+\"foo\""
+	gpiosim_set_pull sim0 1 pull-down
+	dut_regex_match "[0-9]+ falling\\s+\"foo\""
 
 	gpiodbus_release_request "$request"
 }
