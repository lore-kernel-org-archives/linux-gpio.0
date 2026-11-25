Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593651;
	b=te0teQ+FwNWMJBnaCPU8XtR1WCbhWxWX2pJYnKpWZC+mpwKamE8UpaTa4/MKwI5cWnMl
	 FqIVoSdLwx+bhV09VrTlNGl+2lRkH5VxTpejHGi2y9rZ7m/9C/LPmGWRwKEexrr1iPFJ5
	 vHrNaHyibHMY8BPgQSwqLFwKHu/v7JSfrQb6U4KMmvzSANyDNjxojfmxGcxLlKrbdXHni
	 DvK5h5kcIDhDom+PG9XVTCATRi+zukWROpblcTddbhef2Qsm+L677e6xLQgZcEU2p5k4g
	 wQQOo/co/berd578El1iXV8kAbEHfi7+rw+/7NBwU/H6N/7cLLakStwUOumn8+CwWxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gqLJUFkh9jhF+ez0eqbuRAzBakFTzqOB3kRBDhfbVDs=;
	b=yOWtR0xEgWAcTUoZb/mOA7NaYIAsXphmMophWmP+F3EJaz5qb5NH38J1Tq/ue3hi/B5P
	 rxBLwuXMtIUfLef5cq5ihn0nM/pofCZurOHd/EAQrH9rAulLpZEP4vrcxY6YAa564+8/U
	 UPi/ib5GpeyviXMxVmLyY1lgGZw+5597Zyn971OxGGUjkyUWeCUNKec6jPI/Ma4AyV3yr
	 Tf8qGpPbYdqkQ1JivYk4rdrqtX2Mez+7eqNVoKIQISlMcvybob6i6XjQ2Ew8AwmFSZOjS
	 UEUJMFPcksH4EaH4XRHBx3vUd1igHyUefikr9CU3hyBthsp9P1TktI+XxECdS9e6Jjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT4dbdQg;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1EC606A68B
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 08:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1EC606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT4dbdQg
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso7185862c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 00:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593650; x=1796198450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqLJUFkh9jhF+ez0eqbuRAzBakFTzqOB3kRBDhfbVDs=;
        b=vT4dbdQggKDOBDmDduYGG7hsSHXCVONv76LD0Byp9QDKp9TqBwEm5rCEwDeDWvU6b4
         Bbuc0KMwFQGqLX3vyIxAHdwf+Lztq5G9N/8WDk6VlC/zTQzZmH+DX5hznARq/AQHOIxB
         /1/Wu9hmgppncMMP634ZIpCnV7mQYKh8ZrpxojoSeYO+PkneU7niTbnw9IaOxux9YSrh
         VowLJ8hgQ99BWGpHjRjBNidyGFCWwsMxBgglD/t9YS1qtX8XGTYMIp3hHPRHQXuSpIYL
         B57MJjBL7jQ3ONHoeAY9DzBiuG6sjT4XGv5Q0dLInAvrS6OD3s751/hzn6Ukhbax6LnP
         wHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593650; x=1796198450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqLJUFkh9jhF+ez0eqbuRAzBakFTzqOB3kRBDhfbVDs=;
        b=Uy/8AZurdO3ri+g8QAocbOriqbct7PtvWmxdpVLtEc+WUj0RA7M7zTuJLx+p998zum
         kmat7eLjtdHu3xws3bVm16+K32SMwY3aX4npncHM+fq5ErAMBPSpDUAHlldaFJFUYN8v
         oKGgE19q5NNtSFA5msMZ89jO4icaX4nNk57m+SatJjn1h42mgGB8JqwZ+bMu3X3ZYrUC
         VB60U4D+KCwNmuzxvkmprfKNi2U7ymJrF1+0ITK9yoYwR4rKJnDDqxwZ4H0jCEIMPI0F
         ays4LHHXgLB+Y3e9N0nmgk2g1hWv1yQs83eAi/oMTaGfOA/k+JbnEx2S6SNE5q+XmkQt
         4Dug==
X-Gm-Message-State: APuU4Z9HQdpuyMU/4V2TEz7lFNkPF57kpsiw2dXE/39ApWS/dTzBvObv
	3EiFKL8inZLm2QWkvoVemMpQO9MiOBGhF/0Dd76HtAS1/BgoZ+8kTBmvKmTwRkLZ
X-Gm-Gg: AZFdTZdAUeN8lfWUEaCcXktK1jZlKT4jH0xlVup3lw75RWW7UfYH631KCj7W66+H9Yi
	YAM7/QKSRhgTzuvk3uAeZUUNHauCLc38uDHgYKSvwqDJi5kKmBkKwRk+wmeEJMStk5/b/OhtmdM
	EnoFE0H/Vcgm/iprrL2zsJraH/CS4rvMYSHgv1kyttm9Pn9Cw4Z5S+x6qQLnIfOS5VYI5NsPgTN
	XOQkj6p4vUUV8/nO/VMcEG0kb+wfgtHxdGjzCIMYJ4JkxkrzN4iEzpax5p/GChpv3W7zquwSvIe
	jPJMgXl0xzfFlMNBaJJ+MQ6KUzNzqC7jtlcV4XNsdTOjqmhUlU9kiuk0kNP87NNSkm9fVLg5WZj
	/LsNsaC1HrRtPHe+YES2vniHyE3K/2bjoShGU/Q2KQ1OkSCHvP29hw/YXAYPtaO5xZt4Ip91twb
	k+uTTj+jVc0GSUvzGbJMYz0j1HpC2bwcpNKZVAxazAVa+SLDj6SOYOIWTrKebeMZHMinK2aOSnM
	eOUGHcbZUKmy5IMuyQvrsLvt0mTTkDaJHWz8RUF8rRgw2ZvkDlGdOrAfp0y+JNU1fjCQUMMt66y
	nUOjhRWEfXzrOwje+vI5KmFag5viGTVHZzGljNIgsq2IhYBWUpFyZOVnPYySIiECJyCNhX0PQ38
	96SPD+Qhboh3eK+tR7sXJjtpP0Y+IP0CgaKVxthaTk8iCpMR6Rtmt5MTTBWpBIpHuy/L43WeMQU
	OhF69aW8SayuTya64NARvlmGb7lySrX3o9ySJTWVRMpDoBwAvP63LIUu3/fJ9vJDZL4xQA8yuxO
	sq6SEeIJgxs+Wp6tTG2ZjQFE4RyFjwniWWtcG+JBIO/U5I6Uun/08Ql9NxuBe71/ySPBjjZ/HEv
	hItk3a0CcMP7kXX9
X-Received: by 2002:a05:7301:5f84:b0:385:f410:fe74 with SMTP id 5a478bee46e88-385f4110110mr23584531eec.26.1795593649986;
        Wed, 25 Nov 2026 00:00:49 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18408101eec.9.2026.11.25.00.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH libgpiod 2/2] dbus: client: tests: wait for each event in test_monitor_multiple_lines_by_name
Date: Wed, 25 Nov 2026 00:00:45 -0800
Message-ID: <20261125080045.2410076-3-raj.khem@gmail.com>
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

From: Khem Raj <khem.raj@oss.qualcomm.com>

The test pulls line foo up, line xyz up and line foo down again in quick
succession and only then reads the monitor output, which is the same
race test_monitor_all_lines_on_request had. Two changes of the same line
that happen before the gpio-sim interrupt is handled are delivered as
one interrupt, and as edge detection is set to both edges the kernel
derives the edge type from the line value read in the handler. The
rising edge on foo is then lost and only a falling edge is reported,
timestamped after the rising edge on xyz:

  ASSERT: '45056166795 falling "foo" 45056147828 rising  "xyz"' did not
  match '[0-9]+ rising\s+"foo"'

This fails intermittently, in 13 of 20 runs in a qemux86-64 guest.

Wait for each event before triggering the next one. Matching the next
line of output instead of searching all of it also makes the test
verify that the change of line bar, which is not monitored, is ignored.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 dbus/client/gpiocli-test.bash | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
index ede69c9..ebddcbf 100755
--- a/dbus/client/gpiocli-test.bash
+++ b/dbus/client/gpiocli-test.bash
@@ -1376,14 +1376,14 @@ test_monitor_multiple_lines_by_name() {
 	dut_run gpiocli monitor foo xyz
 
 	gpiosim_set_pull sim0 1 pull-up
+	dut_regex_match "[0-9]+ rising\\s+\"foo\""
+
 	gpiosim_set_pull sim0 5 pull-up # This should be ignored
 	gpiosim_set_pull sim0 11 pull-up
-	gpiosim_set_pull sim0 1 pull-down
+	dut_regex_match "[0-9]+ rising\\s+\"xyz\""
 
-	dut_read
-	output_regex_match "[0-9]+ rising\\s+\"foo\""
-	output_regex_match "[0-9]+ rising\\s+\"xyz\""
-	output_regex_match "[0-9]+ falling\\s+\"foo\""
+	gpiosim_set_pull sim0 1 pull-down
+	dut_regex_match "[0-9]+ falling\\s+\"foo\""
 
 	gpiodbus_release_request "$request"
 }
