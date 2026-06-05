Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7CE30D3F0
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621246; cv=none; b=SfXcbCuqcPRG9ujusLxF+ARapgf5FE6W40LojKRI7DVs8DKcTOCXfEFdZLIHIHwJ1ZMiz5kRFy57IvbQa8F5079aDK5vumQVHTAc0hT7fcwALyujz/HuqnM5HGa1crir/dmSTOIKdA1Z9f22m+G5n44s6Fyp83BNPVnmfwrkG/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621246; c=relaxed/simple;
	bh=Tnu576MfKVY9CS43sYUQz8GphW2+pJ42xoN6I+3tod0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QomNZyqmKMoQT/2DnPjXQX7a9/nQ49EnFwcC6LyLtUkTDMDJ9ncZT+YOYXH5HnWAJNPt/Ku9oUBQ2JSrMZUXPUYi5jkRzruW9TV7FYIT9FTgMUEmdac0zsqsL/OXthoH+tyqFxMzXvxMKaLC83/sk/rRfmBC/Vav1p8SlI1BkuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=CsRKk3jW; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="CsRKk3jW"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-48670d35a87so1012240b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 18:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621231; x=1781226031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szIQNyD+NnmIvV9OHmmg2MxKrIQLLZ2S3wbfJkga4t0=;
        b=CsRKk3jWi2MjyYTHcXcu+g9BIRhhDRY+CBM5IentGbpNXAGZFhXf2kglnF8AGQUZF2
         EsYHRzrk0IGpSSxAmvMI6BmHKJP6unNhEYwDbOfWeKXghAxVEABDeJmeYcmw1uyYYHit
         bONgr7r6hm5a3TM/4fkbJvlnUYdug7pPXkS627wXhZO0QQRGrf3z9wUbwMxx/eP4Ts/d
         Rvt808ugmjTpbyL1zPHtsocxDknJzb+RR+r3JNU0Gfxw5HMia/o041L3M/nAZxcLj8tG
         IliidHW6jE81G13WfFSJIVKS5VT3AnuWnfuPt7zBMVivG3qc88elH21BbNEw6n3l5TfT
         G7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621231; x=1781226031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=szIQNyD+NnmIvV9OHmmg2MxKrIQLLZ2S3wbfJkga4t0=;
        b=sAwl4kGcmkiNfd0jbUssDNXGxidJARomzxoC4SoOiWrjWl+GldHR1/JN54O4XWdiYb
         F+xqKrnofIPTZM3TrBfefXF0RSSFeIAYsfyElRuBHpxeHhAhJcabllbIp8HNmDF7MYCa
         qMKse+54rx8PMvvBMkiNB8ZC75eiJi+WeDc1wVEZbXOUO4GCOzZyxfl3WhVF2xZDhP/F
         6EqdopJGkiV7jyWTR2y2hDd0yLh+Bt1gvBxKElSQ9fWPJKYkHdEB+PYoAJLZlSKqy58u
         XKSqNQ6Djr41FunV+soNZf5im1F1/F0qCYlvvx/kWEB3ZqNhAST0eBz7Hva3XSCSAUQK
         hg9A==
X-Forwarded-Encrypted: i=1; AFNElJ9yTqDgkYFn2rj2/4mwZ7rqe16HbmWbDSM/uOM7Iln/2l0kZ94ZG1YuCMrE+QobMlAsreSim5LMvmoG@vger.kernel.org
X-Gm-Message-State: AOJu0YwPBvBkeFy1f4n6QLR8N+EyzGE0x4kJshDX4Kg+FuTPL4fClvmi
	3wWRiTF1ivpJCGcCzToqF6eHHwcrJRq4n5Y4dxWoLkdvLkpyhHoydpF6gAsvbkK7WwA=
X-Gm-Gg: Acq92OGo7lkgerDRl5n4a6xD99ATYRsZ5No9dctCLwsUOUE7UnPqeSzevueDHNExjWR
	E17XmrQ1txI0cpQhSMfssF/GTABJkiz9YBqpX393BmLY33ctc5hcHTKUNaQXr6Coim0FsoaNon8
	eVVa2KcORd5zA1WOvVLQFEYg+U3w+kKnD3B5SJZlYNZCvKYrIKNs/TLWWgDJ+tHq9naIr8+ghUQ
	63l/xCRT6nmhG+m2qmDx4/3crqGOn/iV0jJDCCPNAARj4lZ+vZURPcuy08GS3A75z5S2kiJ+yG+
	ME2Bwgz5FJd7CS7YTJaBmZB+57R07Mn8DLp2iJGq0Xpl7mg0SVDFB4siWK1T4dcwRIZe4NuwYNR
	uM+4/i6FKO3S+3nd6Teq0SGmqQFczN1qYtanGSA7RkcD/ASVQ6SLXXzoABMM7wDvdoNAkhRjqzr
	1P17RiSH5YEh8oAFIay4rA/dmcaZOJ+XpDshqSVA==
X-Received: by 2002:a05:6808:30a6:b0:47b:d07b:ec9a with SMTP id 5614622812f47-48692d347d3mr155790b6e.15.1780621231634;
        Thu, 04 Jun 2026 18:00:31 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 01/14] dt-bindings: net: qca,qca808x: Add regulator properties
Date: Thu,  4 Jun 2026 20:00:08 -0500
Message-ID: <20260605010022.968612-2-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

QCA808x has four different power rails (although in many board designs
the different rails share a regulator). Add each of these supplies
to the corresponding DT binding.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/net/qca,qca808x.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,qca808x.yaml b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
index e2552655902a3..3c1b7eca33caf 100644
--- a/Documentation/devicetree/bindings/net/qca,qca808x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
@@ -25,6 +25,18 @@ properties:
     enum:
       - ethernet-phy-id004d.d101
 
+  avdd18-supply:
+    description: 1.8v analog power supply.
+
+  vdd-supply:
+    description: 1.05v power supply.
+
+  vdd18-supply:
+    description: 1.8v power supply.
+
+  vdd125-supply:
+    description: (1.25v to 1.98v) LDO regulator power supply.
+
 unevaluatedProperties: false
 
 examples:
@@ -39,6 +51,8 @@ examples:
             compatible = "ethernet-phy-id004d.d101";
             reg = <0>;
 
+            vdd-supply = <&phy_vreg_1v8>;
+
             leds {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.51.0

