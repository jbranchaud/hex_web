[name, username] = System.argv

package = HexWeb.Repo.get_by!(HexWeb.Package, name: name)
user    = HexWeb.Repo.get_by!(HexWeb.User, username: username)

unless package do
  IO.puts "No package: #{name}"
  System.halt(1)
end

unless user do
  IO.puts "No user: #{username}"
  System.halt(1)
end

HexWeb.Package.build_owner(package, user) |> HexWeb.Repo.insert!
