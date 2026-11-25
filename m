Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650192;
	b=CemYcWFa6CgoM3rxmC+lBH1VI8D9tCf5mFs94h4s7YmosJMkGWpvk9MKAre4xbm0HXQ1
	 rO/eEzIOxZ/UDTOx8IYPCbM38XZFZm97xbzhRFPf3I5RwGagyKeOWCZXQeWXOTwHaOH2/
	 wbjWVH3fjeN6ASaV1BxPs7ktPOPFln7umUK50i/RuG+3nrUsYQ6QKMIjyZ+Fh3LIeil+y
	 Wg8ycLLmNjDkBsBqlmYh/hMLvyTNBLb7uE7hG7yN6SLc7rruOzxk6sn6qwpPccBH1xjiU
	 a0K7w4BBdBb4dQTwNXnasCkkDDZKN65m6Ao32POHF8mqOMRsAwe8Ir01K3nN+8b2MpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=q5G5wLPtPCZ21SWKWqqHTdjsAc7MFdirflTKsgYJbUA=;
	b=1CYT6cIKjX5T4ZWYAilRENR0+K71nCcxx22xmj0dPz5h7Qdqqw7AD9gF84r4LbQnsK+i
	 uC0eiNMBEugw6dx5WuWGJ9kRcHP/irtLL7JWSRl7ZUVxzItGA9tfB1fZuDFpGkClTzQpU
	 u34z9iQEFUWYV4mU0Xbw28EBmGQWbpuycgmRFBfTu9cC122cX2EFfnjGGawu1CGBrJl7+
	 9KkFcgSwZUleTtWMYeQJs0NllGQZ1DHJOeWs0wfz+2V4IuZWEEnYtOEoFd83TQw3uUYvQ
	 X+kcv7qw0iC5Nf1ssS/W99wQIqNHAQWbFEk6TUACz8ySSBfitPshBsW74fTKGNxNIjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOLTHCqK;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D48606A321
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 23:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6D48606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iOLTHCqK
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so8585347c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 15:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795650191; x=1796254991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q5G5wLPtPCZ21SWKWqqHTdjsAc7MFdirflTKsgYJbUA=;
        b=iOLTHCqKfxLSZx8sajM4clpUHFqeKFMtZPTOETEXTjjcuVp1HtC3rMlD9pskqoZP1A
         3oYmE6xes1MgPhJTbakdDYC0wBPXm46oNIcMSQYGTdMeIg1tpdPQ1b5BFH/HvWeaB5Ax
         l/6EXIjg6LJHdxmSuZ4DdLNfzqIW3v4qRmKycCMp9rGxJ746DD1QCQ2tHjkNHtEeJ01U
         4N3jSw+9RbCCMCcZZFoDABq0Qtg5HLoR8mVQoR30hhTNcumiqeuLSfpq+kKYYKCrdSWU
         B9l694EBUQOvPl2NF3ySWJiFogQozquumkBe+I7FBr8eYDgRWLvv7CZQZjbz4gR+lfCa
         Xhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795650191; x=1796254991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q5G5wLPtPCZ21SWKWqqHTdjsAc7MFdirflTKsgYJbUA=;
        b=BlTm0AfntrVeaVxakdpTFDOAnphtxL+8AG2knp3NVqn3Tpc5EzTttDeOXcKod53jMd
         +4fD2MN/N0ouKtkZKFye3lYE3EhNlUqHOau/mz6yceqCOM4UQygp++R+ephp9riydHN0
         i3RASiX/+35gpFnnEqRpkitG73E+rJUP5irsw9h5AoE7wGSlNPZIg7db74oWwWgqVh0Q
         /DRbxumkk4fEo8d0/CMVslz00iaGzq6N/x0+bRmB6PDxidcLLIOHFtAVIFyGlE6FckZo
         otN2ZF9DSlVDxtatCqiVTylTpS551EA138E6w3OtRvMKSpvwtqvGwoF+20pmCu+KKCKm
         cvvQ==
X-Gm-Message-State: APuU4Z+mW5LFkoOydz9ohn5UOIzL++9uEeXFzGo2uNtc2v8hibNEGYCQ
	vRuVludJLLMrm8NrolBpSNTmaRQaU9p262gLiVE/TzBa/JdL231VzgoWJmpsHbtV
X-Gm-Gg: AZFdTZez4buplhlKQ727OqaxrjAUjGzHGhKDMXopDbblm2JwYA+CnseWFxI6yJ02ksd
	KYUkqXEYNAgVsce+f2wSDNX+GXCIvAVs49a3CyK5B+dgbDzYI8/ltEH9WGpcs1cmE32B+7K152h
	t1C/ih0QL/Fb49bXJtuDa74rhFVy33LljBFAIuHviytr17149pKynsuf11UrFPX7gwGQzkayECD
	MfVQjh624nrctxYxo71h+VO8+74zmPIZXMDKEic1528r70jpraoxDdmSNnoBvr7MMPK69QgEZiA
	2fFqs2WZTOsHJG23jN22eu6H6/b02+C7Cjx9SuWNhV2AflrL79KwrCDxPae+GIKCvkV5fgfneEk
	qEUlIUybNsrweXK2+BwBSiP0m7q/V4efYHspuPmeAbspx/GhOFfbzv8hxbEpCMgzBuI6g8QzDAr
	4pcZ1YIx68MkFATJV+B2eDMVW5KA11gSt/XQq46Qdtj1Jhz+w/oSvDHhkJ+TGqGReOtUDwIxy8J
	PijMVd9dwQxwEw8izlC8VWbyh9janeknNhEZvoPCMb5gzRf3Jvn4/p2F/qv2xHQa6g+WgkfQPo8
	fcSvp3+0J1PVftEuGdh8VkqZ78eUD7V3aExJIgLLabZIQGRuB6kNIT+e379FSN3WeIXj+Q5k/Fo
	exRpm/vH+Cm3GNaRhqIVk/PskpVu+DI0dM1BXuus8mgZepomp4qYGQjGisHRyQrwBDn1tVyznW7
	YM0sOn1E2waURh39sDXEgoiyNx6aqDJxkfTfp/r9yKdgAlejRgwvD+Rg8i1O0CCrisG8L8cwKC9
	DrIxPW7egG+6JYzfbOQT2TplnxLrUq2KPWIOwJ7UoHSv4JYhpBKK0/Qf1ec6YS6NW0yuOE=
X-Received: by 2002:a05:701a:cc88:20b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b556823ad5mr19674960c88.3.1795650190814;
        Wed, 25 Nov 2026 15:43:10 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm44678528c88.8.2026.11.25.15.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:43:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH libgpiod v2] dbus: client: tests: wait for each event in the gpiocli monitor tests
Date: Wed, 25 Nov 2026 15:43:08 -0800
Message-ID: <20261125234308.4052324-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.56.1
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

test_monitor_all_lines_on_request and test_monitor_multiple_lines_by_name
pull one line up, a second line up and the first line down again in
quick succession and only then read the monitor output. gpio-sim raises
the line interrupts through irq_sim, so two changes of the same line
that happen before the interrupt is handled are delivered as one
interrupt, and as edge detection is set to both edges the kernel derives
the edge type from the line value read in the handler. The rising edge
on the first line is then lost and only a falling edge is reported,
timestamped after the rising edge on the second line:

  ASSERT: '41610700648 falling "foo" 41610665414 rising  4' did not
  match '[0-9]+ rising\s+"foo"'

  ASSERT: '45056166795 falling "foo" 45056147828 rising  "xyz"' did not
  match '[0-9]+ rising\s+"foo"'

The tests fail intermittently, in 12 and 13 of 20 runs respectively, in a
qemux86-64 guest.

Wait for each event before triggering the next one, like the gpiomon
tests in gpio-tools-test.bash do. In test_monitor_multiple_lines_by_name,
matching the next line of output instead of searching all of it also
makes the test verify that the change of line bar, which is not
monitored, is ignored.

Fixes: a5ab76da1e0a ("dbus: add the D-Bus daemon, command-line client and tests")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
Changes in v2:
- Squash the two patches into one (Bartosz)
- Link to v1: https://lore.kernel.org/linux-gpio/20261125080045.2410076-1-raj.khem@gmail.com/

 dbus/client/gpiocli-test.bash | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/dbus/client/gpiocli-test.bash b/dbus/client/gpiocli-test.bash
index 5160f57..ebddcbf 100755
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
