Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965DE4BB26B
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638259; cv=none; b=agMlXDahQH+j+dTW9w3bG6+QmVRX3PM/hvm30//UUQngD2dqHzwucueQx6nY7MQAJIiFaiitbQA0+3M/iUMQTQT6gTcX+A1U4GLqVS3pZxzTuf7aPSbSX/X1QizoUvROiQJFvOYymBNkXKZ2aalGUI5dpPD1FtCo6d/qgJZbS4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638259; c=relaxed/simple;
	bh=W3avD/gwwEkeiicWHrArtYtKTr1r5cPUIp2WpU4qAoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFoFpPZIut0wHSyI9ti1vRq6YwzSsAWMGlpP2JBrTuJtEK/6wXvuVWRXRGBTitiIL9kayTSxXkmkWwz17ReOSRUgctT2Kh+j+xc5iqUAc2ydC8bCuFxqQy0+nKSz/TMCSSX4LFCILnVcmGbJ3kGT4Bss6l853BEXO5g6MSMbJKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3vQ+B+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLxinP5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3vQ+B+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLxinP5T"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zk1m1520216
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ka3m7yPQ6zXpaZ43TO2KozhhqfAFnwYtxFW
	YYUMBqKs=; b=Y3vQ+B+Z1ecneAXa0LqLRWyTCBNGfHkcOi0J5ItWYzGcKZ/26VQ
	8PdtJfAts7FffvIKXWog/HBqpgKqMP+QJEE7xrzB75uErdlUFaJbU0eGifhGFXV3
	dzul8nXZLPHTiWTErSwr4UGwv9c6romnIKMqtwOuyHXLIaLgcw7Y4OTMLFvwjzcj
	xFJDYGslHOljhLMSag1FNde8MOSue43UPini1C8WrlYYi0/LrtB+WC/hqG7InHhi
	tlJzXH/8Fwr/IlMEzAD2K7j930N2CliHJtV1hxEST/nvfwzlMZjyc0FOuR7Eg3Ae
	+7fDfEfAtDKLGWBsxrP6IOOUfK7zSpQ3ZIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hbkcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:44:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a01d1d1b6so84727485a.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638243; x=1790243043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ka3m7yPQ6zXpaZ43TO2KozhhqfAFnwYtxFWYYUMBqKs=;
        b=FLxinP5TUfLQilmCCEyeoll1PGc3srvzJVNfu46lj6o3TqdMWyn7sW7XrS/fTp+LYG
         25COkbKBplJ4PrMzuy05Nc0Mr7MuOz4Pc2KcnzCNoYkEUkbymna0949D9sOyR3xA+PTb
         JF1iNmIvK/VJBo6hLAN4JBLo+hj6B1O34+YrMrdhtSeqjBppLGGWGQ3PNZvWPv5+R/Ag
         ZuQA8E9DvtTllkkK88U84O1M3Tvh834dzfMUJlgW1zwOx64TwSxZIErn7xO2rwUup1ci
         91x17tvHvIbbcy8WN6Bd8qbSOMk3KCUIZWbBSDPEZkvEhEAlUpcW2ysebbVaUaYQ24SR
         BNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638243; x=1790243043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ka3m7yPQ6zXpaZ43TO2KozhhqfAFnwYtxFWYYUMBqKs=;
        b=nXJpCWfyesdEs85FLlYgt2WVvhuwyL1WRIVBSbvS9XTNVz99vZtSV6+bkYSIvKYgbc
         55Les0jRh8nkO3svvIP8Q4T1Dd50DupcCzWP7p8bQ4zu8PMbpFeUzZ6sftJRV4FGpoU3
         Jj/SsYDOv+OP//EMQEuTFA6YINgycJjZ1kUqo1Z5DFalfRWFsizrulTPpcwheHewB4KW
         26gs14rg1+s+enjR8f5o6Chyx8yTnVkZASnLsI6rycY8iezYB3SSTP/gupFPjiMkZK+B
         J1TK+eh0zhYPEoF6oAwUAjwnFouIIk8Itrql4zTtCYWfy7M6GqFqPKOze/BTbHcWSOU+
         6kHA==
X-Forwarded-Encrypted: i=1; AKwUvByl4oUT7F7C6VdEbREMDjYOQ0sro+uFxXijU+ooSQAoBNJOA1fSOXHhjKxW2gnT6TDJPseBycrqtulf@vger.kernel.org
X-Gm-Message-State: AFuF++ntLXcM4W8zUxvQA+y2Kp3C+ikpzZ2d/Os8go4qqu6qqH0pIgSi
	3mUMwoDaXP/51l+cYo0oQbsszYKw73i6ke9q9BYFWvAwLdLxqKlwGNyM6IJ6XF9uKSIlki8zEJ7
	uYs/ugMUNXHBsZrvXDiZDhJKNYAh1FjsEzsi2ABBD90szArgNXyS/hXkeT3D/fibs
X-Gm-Gg: AYBFou39zGsnLLplDxrvpH96OpW3xkOE6MZ/TIcdSapx5MIDKq+Om23oUR+Tl51hfq6
	KeImOVXwWl562MfZO8J2rA2rsDaCb6QWtf3iC45ClqJHrd47ZPW5RoMEX9s7wF+zLfA7QTzNTv8
	xhvaW5P1+RQTxpGIFv9uGRYIczXgviimI7aN7XVNwPbRl/bXw7C7q0wPWKMM+pr9wQ5jAY7zAko
	mYK5wlVgOjW1+naUsCXGPc7LBRceMle49OdRDRhzD9QN8hgiZl5xaMiG1rx8s7ZC+U1+Aa3JcY3
	QZNsUqYi/8C1cWyviLDBgrWia4ka8Vw5onKUepbkBwp/mC55cvqov1GDvWLelmHdDrPap1lRWVC
	j6zQ3rAQDjUTk20vwmR1Q2K301Jg=
X-Received: by 2002:a05:620a:470c:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bb7880659mr1030778685a.34.1789638242982;
        Thu, 17 Sep 2026 02:44:02 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bb7880659mr1030775885a.34.1789638242561;
        Thu, 17 Sep 2026 02:44:02 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbda7c462sm515895e9.4.2026.09.17.02.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:44:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm pin control fixes for v7.3-rc4
Date: Thu, 17 Sep 2026 11:43:56 +0200
Message-ID: <20260917094356.7040-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzMSBTYWx0ZWRfX/dKNsfG0UDUc
 g/SJgXO4OgIcXfgmU76bmOMmss1fChz2qGQbr6G7QK8JzJ3L/lOI8HvuaJQjxnZq/JlH2vqevfo
 01AvMDrzfD3WMIgYUIApdd1p5btXNP17/kwd4sZ+V16gqKsgcGrg1yHk4kFM1PceDJyPU0LRixB
 koXTkfFjUky6PGvaV4qYib/LEhKnVJjPoLlycMB65dGXAY5oK37f1Kb0kmBGb//RzbzCarFiC9D
 5w3uc0HGfmoLhrso0TKBCK3tN0rZT6KkREWIewLpupWBKXbKO4ih7zg5lf4nU3BacHBt8RDuu4/
 xf3DKG44cAS0j1yg/vDs308wH2pnRx9EPgGlaXsRi4KIoncAJsvp/MmYQ+x1Oc3BzrMmYrUVQUV
 +SXyScJeT7kVeavCONBi+QluJa9h/gJvM/UdWbfze/NpQJ9OUn8YqtsmOYjb0t8vvmtZbmAC1Qy
 mAT+fiacEGIkIM/NO7Q==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabb663 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=P8F4T-NFUzOHK0OehmwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CMr689MSAANB5Oo3LXqLDx5gxnDpRh36
X-Proofpoint-ORIG-GUID: CMr689MSAANB5Oo3LXqLDx5gxnDpRh36
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzMSBTYWx0ZWRfX8cSspRWNLGqY
 C5RR2X2J4XpTZUcLHBFscqnxewO03NSdDhdl4xW73r11HTVZBfdcB10Sc7YmUy3UxMScNQrPe4f
 ELgizjHbTaRh/DDci9MZWxkbatBxU1k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170131

Linus,

Please pull the following set of Qualcomm pin controller fixes for the
next RC.

Thanks,
Bartosz

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pinctrl-qcom-fixes-for-v7.3-rc4

for you to fetch changes up to 818103dc7f5998a0d7957fb71d4deecdf4d579e1:

  pinctrl: qcom: ipq5210: Publish the OF module alias (2026-09-07 10:51:54 +0200)

----------------------------------------------------------------
Qualcomm pin control fixes for v7.3-rc4

- fix QUP1 functions in pinctrl-nord
- add missing MODULE_DEVICE_TABLE() for pinctrl-ipq5210

----------------------------------------------------------------
Shawn Guo (1):
      pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions

hpp.iscas (1):
      pinctrl: qcom: ipq5210: Publish the OF module alias

 .../bindings/pinctrl/qcom,nord-tlmm.yaml           |  7 +++--
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             |  1 +
 drivers/pinctrl/qcom/pinctrl-nord.c                | 34 +++++++++++++++-------
 3 files changed, 28 insertions(+), 14 deletions(-)
