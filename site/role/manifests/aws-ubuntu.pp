aws_instances { your_vm:
  ensure             => 'present',
  image_id           => 'ami-c7e0c82c',
  min_count          => 1,
  max_count          => 1,
  key_name           => billdiamond,
  instance_type      => 't2.micro',
  subnet_id          =>  subnet-06ea84d499d21204f
  tag_specifications => [ { resource_type => "instance", tags => $tag } ]
}
